class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    store = Store.find(params[:store_id])
    @item = current_admin_store.items.new(item_params)
    @item.store_id = @store.id
    @item.save
    redirect_to admin_store_item_path(store.id, @item.id)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    store = Store.find(params[:store_id])
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_store_item_path(store.id, @item.id)
  end

  def destroy
    store = Store.find(params[:store_id])
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to admin_store_path(store.id)
  end

  private
  def item_params
    params.require(:item).permit(:store_id, :category_id, :name, :explanation, :without_tax, :image)
  end
end
