class Public::NewGourmetsController < ApplicationController
  def index
    @items = Item.order(created_at: :desc).limit(4)
  end
end
