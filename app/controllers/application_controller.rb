class ApplicationController < ActionController::Base
  include Pundit::Authorization
  before_action :authenticate_user!

  after_action :verify_authorized, except: :index, unless: :skip_pundit_for_non_users?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit_for_non_users?

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def skip_pundit_for_non_users?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  # def no_policy_scoped_controller?
  #   params[:controller].in?(%w(pages))
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :brand])
  end

end
