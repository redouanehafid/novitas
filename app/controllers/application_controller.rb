class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?


  def is_admin?
      if current_user.admin?
          true
      else
          redirect_to root_path
      end
  end
  protected

  def configure_permitted_parameters
    # devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :logo)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation, :current_password, :image, :nom ) }
  end

end
