class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_guest_user
  def create
    @cart_item = CartItem.new(cart_item_params)
    @item = Item.find(cart_item_params[:item_id])

    @cart_items = current_customer.cart_items
    if @cart_item.amount.to_i == 0
      flash[:alert] = "個数を選択してください。"
      render template: "public/items/show"
      return
    end

    # 同一商品がカート内にあれば個数を加算する
    @cart_items.each do |cart_item|
      if cart_item.item_id == @cart_item.item_id
        new_amount = cart_item.amount.to_i + @cart_item.amount.to_i
        if new_amount > 5
          flash[:alert] = "1つの商品の購入上限は5つです。"
          render template: "public/items/show"
          return
        end
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
      flash[:notice] = "カートに商品を保存しました"
      redirect_to cart_items_path
      return
    end

    # カート内のアイテムの店舗情報が同一か確認
    @cart_items.each do |cart_item|
      if cart_item.item.store_id != @cart_item.item.store_id
        flash[:alert] = "1度に複数の店舗から購入することはできません。"
        render template: "public/items/show"
        return
      end
    end

    # 同一店舗が確定しているので、カートに保存
    @cart_item.save
    flash[:notice] = "カートに商品を保存しました。"
    redirect_to cart_items_path
  end

  def index
    @cart_items = current_customer.cart_items
    @product_total = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(amount: params[:amount])
    flash[:notice] = "商品の数量を変更しました。"
    redirect_to request.referer
  end

  def destroy
    item = Item.find(params[:id])
    CartItem.find_by(item_id: item.id).destroy
    flash[:notice] = "商品をカートから削除しました。"
    redirect_to request.referer
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end

  def ensure_guest_user
    if current_customer.nickname == "guestuser"
      flash[:alert] = "ゲストは商品を閲覧することしかできません。"
      redirect_to searches_path
    end
  end
end
