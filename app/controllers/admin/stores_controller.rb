class Admin::StoresController < ApplicationController
  before_action :authenticate_admin_store!, only: [:index, :show]

  def index
    @stores = Store.where(owner_flag: false)
    unless current_admin_store.owner_flag == true
      redirect_to admin_store_path(current_admin_store.id)
    end
  end

  def show
    @store = Store.find(params[:id])
    @items = Item.where(store_id: @store.id)
    if current_admin_store.owner_flag == true
      return
    end
    unless @store.id == current_admin_store.id
      redirect_to admin_store_path(current_admin_store.id)
    end
  end
end
