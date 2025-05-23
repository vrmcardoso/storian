class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile_photo])

    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile_photo])
  end

  def after_sign_in_path_for(resource)
    user_profile_path(current_user)
  end

end
