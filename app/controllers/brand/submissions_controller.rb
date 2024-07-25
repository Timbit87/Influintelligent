class Brand::SubmissionsController < ApplicationController

  def index
    @submissions = current_user.submissions_as_brand
  end

end
