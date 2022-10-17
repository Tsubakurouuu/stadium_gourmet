class Public::SaleAreasController < ApplicationController
  before_action :authenticate_customer!
  def show
    @sale_area = SaleArea.find(params[:id])
    @stores = Store.where(sale_area_id: @sale_area.id)
  end
end
