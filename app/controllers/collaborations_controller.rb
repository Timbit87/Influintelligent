class CollaborationsController < ApplicationController
  before_action :set_collaboration, only: %i[show edit update destroy]

  def show
    @user = User.find(@collaboration.user_id)
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

  def edit; end

  def update
    if @collaboration.update(collaboration_params)
      redirect_to @collaboration
    else
      render :edit
    end
  end

  def destroy
    @collaboration.destroy
    redirect_to collaborations_path
  end
  
  def index
    @collaborations = Collaboration.all
    @categories = ['Fashion', 'Beauty', 'Lifestyle', 'Travel', 'Food', 'Fitness', 'Tech', 'Art', 'Music', 'Sports']
  end

  def category
    @category = params[:category]
    @collaborations = Collaboration.where('category @> ARRAY[?]::varchar[]', [@category])
  end

  def new
    @collaboration = Collaboration.new
  end

  private

  def set_collaboration
    @collaboration = Collaboration.find(params[:id])
  end

  def collaboration_params
    params.require(:collaboration).permit(:title, :description, :price, :start_date, :end_date, :user_id, category: [])
  end
end
