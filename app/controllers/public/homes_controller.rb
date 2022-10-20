class Public::HomesController < ApplicationController
  before_action :ensure_admin_store
  def top
    @items_new = Item.order(created_at: :desc).limit(4)
    @items_rank = Item.order(earning: :desc).limit(5)
  end

  private

  def ensure_admin_store
    if admin_store_signed_in?
      flash[:alert] = "管理者でログイン中は顧客ページにアクセスできません。"
      redirect_to admin_store_path(current_admin_store.id)
    end
  end
end
