class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin_store!, only: [:index, :show]
  def index
    # 管理者かどうかの分岐処理を記述
    if current_admin_store.owner_flag == true
      @store = Store.find(params[:store_id])
      @orders = @store.items.flat_map(&:orders)
    else
      unless params[:store_id].to_i == current_admin_store.id
        redirect_to admin_store_path(current_admin_store.id)
        return
      end
      @store = current_admin_store
      @orders = Order.includes(:items).where(items:{store: current_admin_store})
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @product_total = 0
    if current_admin_store.owner_flag == true
      return
    end
    unless params[:store_id].to_i == current_admin_store.id
      redirect_to admin_store_path(current_admin_store.id)
      return
    end
  end

  def update
    @order = Order.find(params[:id])
    # 注文ステータス更新時の処理
    @order.update(order_params)
    redirect_to request.referer
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end
