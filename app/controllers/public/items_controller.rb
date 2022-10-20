class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  #   @cart_items = current_customer.cart_items
  #   @cart_items.each do |cart_item|
  #     if cart_item.item_id == @item.id
  #       @new_item_stock = @item.stock - cart_item
  #     end
  #   end
  end
end

