# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :ensure_admin_store
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # ゲスト用
  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    flash[:notice] = "ゲストでログインしました。"
    redirect_to searches_path
  end

  #ログイン成功後の遷移先
  def after_sign_in_path_for(resource)
    searches_path
  end

  #ログアウト後の遷移先
  def after_sign_out_path_for(resource)
    root_path
  end

  private

  def ensure_admin_store
    if admin_store_signed_in?
      flash[:alert] = "管理者でログイン中は顧客ページにアクセスできません。"
      redirect_to admin_store_path(current_admin_store.id)
    end
  end
end
