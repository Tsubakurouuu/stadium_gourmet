class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin_store!, only: [:index, :show]
  def index
    # 管理者かどうかの分岐処理を記述
    if current_admin_store.owner_flag == true
      @store = Store.find(params[:store_id])
      @orders = Order.includes(:items).where(items:{store: @store}).order(created_at: :desc)
    else
      unless params[:store_id].to_i == current_admin_store.id
        flash[:alert] = "他の店舗の注文履歴は閲覧できません。"
        redirect_to admin_store_path(current_admin_store.id)
        return
      end
      @store = current_admin_store
      @orders = Order.includes(:items).where(items:{store: current_admin_store}).order(created_at: :desc)
    end
  end

  def show
    if current_admin_store.owner_flag == true
      unless Order.exists?(params[:id])
        flash[:alert] = "注文詳細が存在しません。"
        redirect_to admin_stores_path
        return
      end
      @order = Order.find(params[:id])
      @order_details = @order.order_details
      @product_total = 0
      return
    end
    unless params[:store_id].to_i == current_admin_store.id
      flash[:alert] = "他の店舗の注文履歴は閲覧できません。"
      redirect_to admin_store_path(current_admin_store.id)
      return
    end
    unless Order.exists?(params[:id])
      flash[:alert] = "注文詳細が存在しません。"
      redirect_to admin_store_path(current_admin_store.id)
      return
    end
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @product_total = 0
  end

  def update
    @order = Order.find(params[:id])
    # 注文ステータス更新時の処理
    @order.update(order_params)
    flash[:notice] = "注文ステータスの更新が完了しました。"
    redirect_to request.referer
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end
