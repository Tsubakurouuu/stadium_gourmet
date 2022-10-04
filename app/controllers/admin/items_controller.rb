class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @store = Store.find(params[:store_id])
    @item = current_admin_store.items.new(item_params)
    @item.store_id = @store.id
    @item.save
    redirect_to admin_store_item_path(@store.id, @item.id)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  private
  def item_params
    params.require(:item).permit(:store_id, :category_id, :name, :explanation, :without_tax)
  end
end
