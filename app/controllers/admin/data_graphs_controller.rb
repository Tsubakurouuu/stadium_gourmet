class Admin::DataGraphsController < ApplicationController
  def index
    @items = Item.where(store_id: current_admin_store.id)
  end
end
