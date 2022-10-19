class Admin::StoresController < ApplicationController
  before_action :authenticate_admin_store!, only: [:index, :show]

  def index
    @stores = Store.where(owner_flag: false)
    unless current_admin_store.owner_flag == true
      flash[:alert] = "他の店舗の閲覧権限はありません。"
      redirect_to admin_store_path(current_admin_store.id)
    end
  end

  def show
    if current_admin_store.owner_flag == true
      unless Store.exists?(params[:id])
        flash[:alert] = "店舗が存在しません。"
        redirect_to admin_stores_path
        return
      end
      @store = Store.find(params[:id])
      @items = Item.where(store_id: @store.id)
      return
    end
    unless params[:id].to_i == current_admin_store.id
      flash[:alert] = "他の店舗の閲覧権限はありません。"
      redirect_to admin_store_path(current_admin_store.id)
      return
    end
    @store = Store.find(params[:id])
    @items = Item.where(store_id: @store.id)
  end
end
