# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
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

  #ログイン成功後の遷移先
  def after_sign_in_path_for(resource)
    if current_admin_store.owner_flag == true
      admin_root_path
    else
      admin_store_path(resource)
    end
  end

  #ログアウト後の遷移先
  def after_sign_out_path_for(resource)
    new_admin_store_session_path
  end
end
