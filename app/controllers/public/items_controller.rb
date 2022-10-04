class Public::ItemsController < ApplicationController
  def create
    
  def show
    @item = Item.find(params[:id])
  end
end
