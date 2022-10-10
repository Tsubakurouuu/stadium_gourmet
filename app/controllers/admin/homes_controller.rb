class Admin::HomesController < ApplicationController
  before_action :authenticate_admin_store!, only: [:top]
  def top
    if current_admin_store.owner_flag == true
      return
    else
      redirect_to admin_store_path(current_admin_store.id)
    end
  end
end
