class Brand::SubmissionsController < ApplicationController
  before_action :set_user, only: :index

  def index
    @submissions = current_user.submissions_as_brand
  end

end
