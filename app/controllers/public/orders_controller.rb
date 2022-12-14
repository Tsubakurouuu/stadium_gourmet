class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_guest_user
  def new
    unless current_customer.cart_items.exists?
      flash[:alert] = "カートに商品がありません。"
      redirect_to orders_path
      return
    end
    cart_items = current_customer.cart_items
    cart_items.each do |cart_item|
      if cart_item.item.stock < cart_item.amount
        flash[:alert] = "在庫数を超えての注文はできません。"
        redirect_to request.referer
        return
      end
    end
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.shipping_cost = 200
    @order.order_number = SecureRandom.alphanumeric(6)
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
      if item.stock == 0
        item.is_active = false
      end
      item.earning += cart_item.amount
      item.save
    end

    #保存後カートを空にする
    cart_items.destroy_all
    flash[:notice] = "注文が完了しました。"
    redirect_to orders_complete_path
  end

  def index
    @orders = Order.where(customer_id: current_customer.id).order(created_at: :desc)
  end

  def show
    unless Order.exists?(params[:id])
      flash[:alert] = "注文詳細が存在しません。"
      redirect_to orders_path
      return
    end
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order_detail = @order_details.order(created_at: :desc).limit(1)
    @product_total = 0
    unless @order.customer_id == current_customer.id
      flash[:alert] = "他のお客様の注文情報を閲覧することはできません。"
      redirect_to orders_path
    end
  end

  def complete
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @product_total = 0
    if params[:order][:seat_area].blank? || params[:order][:seat_alphabet].blank? ||  params[:order][:seat_number].blank?
      flash[:alert] = "座席情報をすべて入力してください。"
      render :new
    end
  end

  def error
  end


  private

  def order_params
    params.require(:order).permit(:customer_id, :seat_area, :seat_alphabet, :seat_number, :total_price)
  end

  def ensure_guest_user
    if current_customer.nickname == "guestuser"
      flash[:alert] = "ゲストは商品を閲覧することしかできません。"
      redirect_to searches_path
    end
  end
end
