class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    cart_items = CartItem.all
    @order = Order.new(order_params)
    @order.shipping_cost = 200
    @order.total_price = @order.shipping_cost + cart_items.subtotal
    binding.pry
    @order.save
    redirect_to orders_confirm_path
  end

  def complete
  end

  def confirm
  end

  private
  def order_params
    params.require(:order).permit(:seat_area, :seat_alphabet, :seat_number)
  end
end
