class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def create
    @cart_item = CartItem.new(cart_item_params)
    @item = Item.find(cart_item_params[:item_id])

    @cart_items = current_customer.cart_items
    if @cart_item.amount.to_i == 0
      flash.now[:alert] = "個数を選択してください。"
      render template: "public/items/show"
      return
    end

    # 同一商品がカート内にあれば個数を加算する
    @cart_items.each do |cart_item|
      if cart_item.item_id == @cart_item.item_id
        new_amount = cart_item.amount.to_i + @cart_item.amount.to_i
        cart_item.update(amount: new_amount)
        @cart_item.delete
      end
    end

    ######
    #１度に購入できるのは1つの店舗のみ
    ######

    # カートアイテムが0の場合、無条件に保存
    if @cart_items.count == 0
      @cart_item.save
      redirect_to cart_items_path
      return
    end

    # カート内のアイテムの店舗情報が同一か確認
    @cart_items.each do |cart_item|
      if cart_item.item.store_id != @cart_item.item.store_id
        flash.now[:alert] = "1度に複数の店舗から購入することはできません。"
        render template: "public/items/show"
        return
      end
    end

    # 同一店舗が確定しているので、カートに保存
    @cart_item.save
    redirect_to cart_items_path
  end

  def index
    @cart_items = current_customer.cart_items
    @product_total = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(amount: params[:amount])
    redirect_to request.referer
  end

  def destroy
    item = Item.find(params[:id])
    CartItem.find_by(item_id: item.id).destroy
    redirect_to request.referer
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end
end
