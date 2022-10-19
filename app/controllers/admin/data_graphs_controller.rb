class Admin::DataGraphsController < ApplicationController
  before_action :authenticate_admin_store!, only: [:index]
  def index
    unless params[:store_id].to_i == current_admin_store.id
      flash[:alert] = "他の店舗のデータは閲覧できません。"
      redirect_to admin_store_path(current_admin_store.id)
      return
    end
    @items = Item.where(store_id: current_admin_store.id)
  end
end
