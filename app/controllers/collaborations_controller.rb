class CollaborationsController < ApplicationController
  before_action :set_collaboration, only: [:show]
  before_action :authenticate_brand!, only: [:create, :new]

  def index
    @collaborations = Collaboration.all
  end

  def show
    @collaboration = Collaboration.find(params[:id])
    @submission = Submission.new
  end

  def new
    @collaboration = Collaboration.new
  end

  def create
    @collaboration = Collaboration.new(collaboration_params)
    @collaboration.user_id = current_user.id
    if @collaboration.save
      redirect_to @collaboration
    else
      render :new
    end
  end

  private

  def collaboration_params
    params.require(:collaboration).permit(:title, :description, :price, :start_date, :end_date, category: [])
  end

  def set_collaboration
    @collaboration = Collaboration.find(params[:id])
  end

  def authenticate_brand!
    unless current_user.brand?
      redirect_to root_path, alert: "Only brands can create collaborations."
    end
  end
end
