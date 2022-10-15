class Public::HomesController < ApplicationController
  def top
    @items_new = Item.order(created_at: :desc).limit(4)
    @items_rank = Item.order(earning: :desc).limit(5)
  end
end
