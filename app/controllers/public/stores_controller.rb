class Public::StoresController < ApplicationController
  before_action :authenticate_customer!
  def show
    @store = Store.find(params[:id])
    @items = Item.where(store_id: @store.id)
  end
end
