class Public::RankingsController < ApplicationController
  def index
    @items = Item.order(earning: :desc).limit(5)
  end

  def show
  end
end
