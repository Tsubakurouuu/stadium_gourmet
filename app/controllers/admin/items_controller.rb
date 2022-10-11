class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin_store!, only: [:new, :show, :edit]
  def new
    @item = Item.new
    unless params[:store_id].to_i == current_admin_store.id
      redirect_to admin_store_path(current_admin_store.id)
    end
  end

  def create
    store = Store.find(params[:store_id])
    @item = current_admin_store.items.new(item_params)
    @item.store_id = store.id
    @item.save
    redirect_to admin_store_item_path(store.id, @item.id)
  end

  def show
    @item = Item.find(params[:id])
    @store = Store.find(params[:store_id])
    if current_admin_store.owner_flag == true
      return
    end
    unless @store.id == current_admin_store.id
      redirect_to admin_store_path(current_admin_store.id)
      return
    end
  end

  def edit
    @item = Item.find(params[:id])
    @store = Store.find_by(id: @item.store_id)
    unless @store.id == current_admin_store.id
      redirect_to admin_store_path(current_admin_store.id)
    end
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
