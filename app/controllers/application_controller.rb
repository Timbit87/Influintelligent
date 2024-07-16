class ApplicationController < ActionController::Base

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