class CollaborationsController < ApplicationController
  before_action :set_collaboration, only: [:show]
  before_action :authenticate_brand!, only: [:create, :new]
  before_action :set_category, only: [:index, :category, :new, :create, :edit]

  CATEGORIES = Collaboration::CATEGORIES

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
      redirect_to @collaboration, notice: 'Collaboration was successfully created.'
    else
      flash.now[:alert] = @collaboration.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end
  

  def category
    @category = params[:category]
    if CATEGORIES.include?(@category)
      @collaborations = Collaboration.where("category @> ARRAY[?]::varchar[]", @category)
    else
      @collaborations = Collaboration.none
    end
    @categories = CATEGORIES
    render :index
  end

  private

  def collaboration_params
    params.require(:collaboration).permit(:title, :description, :price, :start_date, :end_date, :banner, category: [])
  end

  def set_collaboration
    @collaboration = Collaboration.find(params[:id])
  end

  def set_category
    @categories = CATEGORIES
  end

  def authenticate_brand!
    unless current_user.brand?
      redirect_to root_path, alert: "Only brands can create collaborations."
    end
  end
end
