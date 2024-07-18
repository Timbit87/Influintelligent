class SubmissionsController < ApplicationController
  before_action :set_collaboration, only: :create

  #As a influencer, I can see all my submissions
  def index
    @submissions = Submission.all
  end

  #As a user i can create a submission
  # /collaborations/:collaboration_id/submissions
  # the new submission form is on the colab show page
  def create
    @submission = Submission.new(params[:submission])
    @submission.collaboration = @collaboration
    @submission.save
    redirect_to collaboration_path(@collaboration)
  end

  private

  def set_collaboration
    @collaboration = Collaboration.find(params[:collaboration_id])
  end

  # WEEK 2 prority "As a brand I approve collaboration applicants"
  # def update
  # end
end
