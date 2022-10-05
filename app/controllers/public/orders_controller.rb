class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.shipping_cost = 200
    @order.order_number = ('A'..'Z').to_a.sample(6)
    @order.save
    cart_items = CartItem.all

    #カート内商品を保存
    cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.item_id = cart_item.item_id
      order_detail.order_id = @order.id
      order_detail.purchase_price = cart_item.item.with_tax_price
      order_detail.amount = cart_item.amount
      order_detail.save
    end
    #保存後カートを空にする
    cart_items.destroy_all
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
