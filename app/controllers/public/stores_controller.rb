class Public::StoresController < ApplicationController
  def index
    @stores = Store.all
  end

  def show
    @store = Store.find(params[:id])
    @items = Item.where(store_id: @store.id)
  end
end
