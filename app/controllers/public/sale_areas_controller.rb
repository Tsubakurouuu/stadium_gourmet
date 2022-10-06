class Public::SaleAreasController < ApplicationController
  def index
    @sale_areas = SaleArea.all
  end

  def show
    @sale_area = SaleArea.find(params[:id])
    @stores = Store.where(sale_area_id: @sale_area.id)
  end
end
