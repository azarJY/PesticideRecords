# frozen_string_literal: true

class Farmer::SessionsController < Devise::SessionsController
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
  
  def guest_sign_in
    guest_user = Farmer.find_or_create_by!(email: 'noukou@gmail.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.last_name = "見本"
      user.first_name = "太郎"
      user.last_name_kana = "ミホン"
      user.first_name_kana = "タロウ"
      user.farm_name = "サンプル農場"
      user.crop = "夏おとめ"
    end
    sign_in guest_user
    redirect_to farmer_current_farmer_path(current_farmer.id), notice: 'ゲストユーザーとしてログインしました。'
  end
  
  def after_sign_in_path_for(resource)
    farmer_current_farmer_path(current_farmer.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
