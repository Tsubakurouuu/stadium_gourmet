class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!
  def index
    @categories = Category.all
    @sale_areas = SaleArea.all
  end
end
