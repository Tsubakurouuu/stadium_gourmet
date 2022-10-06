class Public::SaleAreasController < ApplicationController
  def index
    @sale_areas = SaleArea.all
  end

  def show
  end
end
