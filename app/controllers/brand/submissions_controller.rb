class Brand::SubmissionsController < ApplicationController
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def index
    @submissions = current_user.submissions_as_brand
  end

end
