class PagesController < ApplicationController
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def home
    @collaborations = Collaboration.all
  end

  def show
    @collaboration = Collaboration.find(params[:id])
    @submission = Submission.new
  end
end
