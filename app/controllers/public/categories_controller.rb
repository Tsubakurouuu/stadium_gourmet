class Public::CategoriesController < ApplicationController
  before_action :authenticate_customer!
  def show
    @category = Category.find(params[:id])
    @items = Item.where(category_id: @category.id)
  end
end
