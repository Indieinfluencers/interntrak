class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def require_admin
    unless current_user && current_user.admin?
      redirect_to root_path, notice: "Only admins can access that functionality."
    end
  end

  def require_intern
    unless current_user && current_user.intern?
      redirect_to root_path, notice: "Only interns can access that functionality."
    end
  end

  def require_intern_or_admin
    unless current_user && ["intern", "admin"].include?(current_user.role)
      redirect_to root_path, notice: "You can not access that functionality."
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end
