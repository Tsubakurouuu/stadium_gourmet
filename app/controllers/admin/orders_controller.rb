class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.includes(:items).where(items:{ store: current_admin_store})
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @product_total = 0
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
