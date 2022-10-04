class Public::CartItemsController < ApplicationController
  def create
    @cart_item = CartItem.new(cart_item_params)
    @item = Item.find(cart_item_params[:item_id])
    @cart_item.save
    redirect_to cart_items_path
  end

  def index
    @cart_items = CartItem.all
    @total_price = 0
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
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
