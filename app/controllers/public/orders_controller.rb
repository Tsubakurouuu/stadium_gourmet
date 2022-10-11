class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.shipping_cost = 200
    @order.order_number = ('A'..'Z').to_a.sample(6)
    @order.save
    cart_items = current_customer.cart_items

    #カート内商品を保存
    cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.item_id = cart_item.item_id
      order_detail.order_id = @order.id
      order_detail.purchase_price = cart_item.item.with_tax_price
      order_detail.amount = cart_item.amount
      order_detail.save

      #商品在庫・売上数の更新
      item = Item.find_by(id: cart_item.item_id)
      item.stock -= cart_item.amount
      item.earning += cart_item.amount
      item.save
    end

    #保存後カートを空にする
    cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
  end

  def complete
    @order = Order.all
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @product_total = 0
    if params[:order][:seat_area].blank? || params[:order][:seat_alphabet].blank? ||  params[:order][:seat_number].blank?
        flash.now[:alert] = "座席情報をすべて入力してください。"
      render :new
    end
  end

  def error
  end


  private

  def order_params
    params.require(:order).permit(:customer_id, :seat_area, :seat_alphabet, :seat_number, :total_price)
  end
end
