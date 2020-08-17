class ApplicationController < ActionController::Base
  # before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :set_category
  # before_action :set_current_user

  # private
  # def basic_auth
  #   authenticate_or_request_with_http_basic do |username, password|
  #     username == Rails.application.credentials[:basic_auth][:user] &&
  #     password == Rails.application.credentials[:basic_auth][:pass]
  #   end
  # end

  # def production?
  #   Rails.env.production?
  # end

  protected
  def configure_permitted_parameters
    added_attrs = [ :email, :nickname, :encrypted_password, :reset_password_token, :reset_password_sent_at ,:remember_created_at ,:created_at ,:updated_at]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: [ :email, :encrypted_password]
  end

  # def basic_auth
  #   authenticate_or_request_with_http_basic do |nickname, encrypted_password|
  #     username == Rails.application.credentials[:basic_auth][:user] &&
  #     password == Rails.application.credentials[:basic_auth][:pass]
  #   end
  # end

  # def set_current_user
  #   @current_user = User.find_by(id: session[:user_id])
  # end

end
