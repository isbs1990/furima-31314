class ApplicationController < ActionController::Base
  # before_action :basic_auth
  before_action :authenticate_user!, except: [:show, :index]
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname , :email , :knj_first_name , :knj_last_name , :kana_first_name , :kana_last_name , :birth_day])
  end

  # def basic_auth
  #   authenticate_or_request_with_http_basic do |username, password|
  #     username == 'admin' && password == '2222'
  #   end
  # end
end
