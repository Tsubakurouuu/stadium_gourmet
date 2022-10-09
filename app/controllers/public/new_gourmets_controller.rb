class Public::NewGourmetsController < ApplicationController
  def index
    @items = Item.order(created_at: :desc).limit(5)
  end
end
