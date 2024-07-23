class SubmissionsController < ApplicationController
  before_action :set_collaboration, only: :create
  before_action :set_user, only: :index

  def index
    if @user
      @submissions = @user.submissions
    elsif params[:collaboration_id]
      @collaboration = Collaboration.find(params[:collaboration_id])
      @submissions = @collaboration.submissions
    else
      @submissions = Submission.all
    end
  end

  def create
    @submission = Submission.new(params[:submission])
    @submission.collaboration = @collaboration
    @submission.user = current_user
    if @submission.save
      redirect_to collaboration_path(@collaboration)
      flash[:notice] = "Your submission has been sent."
    else
      flash[:alert] = "There was an error creating the submission."
      render 'collaborations/show'
    end
  end

  private

  def set_collaboration
    @collaboration = Collaboration.find(params[:collaboration_id])
  end

  def set_user
    @user = current_user
  end
end
