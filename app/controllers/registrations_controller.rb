class RegistrationsController < Devise::RegistrationsController
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  protected

  def after_sign_up_path_for(resource)
    edit_user_path(resource)
  end
end
