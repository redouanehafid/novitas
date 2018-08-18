class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :footer

  def is_admin?
      if current_user.admin?
          true
      else
          redirect_to root_path
      end
  end

 
  




  protected

  def footer
   @articlesfooter = Post.all.order('created_at DESC').limit(2)
   @formationsfooter = Formation.all.order('created_at DESC').limit(6)
  end

  def configure_permitted_parameters
    # devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :logo)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation, :current_password, :image, :nom ) }
  end

end
