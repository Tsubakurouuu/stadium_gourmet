class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.shipping_cost = 200
    @order.order_number = ('A'..'Z').to_a.sample(6)
    @order.save
    redirect_to orders_complete_path
  end

  def complete
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = CartItem.all
    @product_total = 0
  end


  private

  def order_params
    params.require(:order).permit(:seat_area, :seat_alphabet, :seat_number, :total_price)
  end
end
