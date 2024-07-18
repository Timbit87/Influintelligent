class CollaborationsController < ApplicationController

  def index
    @collaborations = Collaboration.all
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

  def collaboration_params
    params.require(:collaboration).permit(:title, :description, :price, :category, :start_date, :end_date)
  end
end
