class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :brand])
  end

  private

  def after_sign_up_path_for(resource)
    if resource.brand?
      brand_path(resource)
      redirect_to brand_path(resource)
    else
      influencer_path(resource)
    end
  end
end