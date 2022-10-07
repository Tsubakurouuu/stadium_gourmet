class Public::StoresController < ApplicationController
  def index
    @stores = Store.where(owner_flag: false)
  end

  def show
    @store = Store.find(params[:id])
    @items = Item.where(store_id: @store.id)
  end
end
