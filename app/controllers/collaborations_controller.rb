class CollaborationsController < ApplicationController
  def new
    @collaboration = Collaboration.new
  end

  def index
    @collaborations = Collaboration.all
  end

  def create
    @collaboration = Collaboration.new(collaboration_params)
    @brand = User.brand.find(params[:brand_id])
    @brand.collaboration = @brand
    if @collaboration.save
      redirect_to collaboration_path(@collaboration)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def collaboration_params
    params.require(:collaboration).permit(:title, :description, :price, :category, :start_date, :end_date)
  end
end
