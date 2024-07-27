class SubmissionsController < ApplicationController
  before_action :set_collaboration, only: [:create]
  before_action :set_user, only: [:index, :destroy]
  before_action :set_submission, only: [:update, :destroy]
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

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
    @submission = @collaboration.submissions.build(submission_message_params)
    @submission.user = current_user

    if @submission.save
      redirect_to collaboration_path(@collaboration)
      flash[:notice] = "Your submission has been sent."
    else
      flash[:alert] = "There was an error creating the submission."
      render 'collaborations/show'
    end
  end

  def update
    @submission = Submission.find(params[:id])
    if @submission.update(submission_params)
      redirect_to @submission, notice: "Submission status was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy
    redirect_to submissions_path, status: :see_other
  end

  private

  def set_collaboration
    @collaboration = Collaboration.find(params[:collaboration_id])
  end

  def set_user
    @user = current_user
  end

  def set_submission
    @submission = Submission.find(params[:id])
  end

  def submission_params
    params.require(:submission).permit(:status)
  end

  def submission_message_params
    params.require(:submission).permit(:status, :message)
  end
end
