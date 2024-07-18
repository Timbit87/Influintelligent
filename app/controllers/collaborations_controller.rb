class CollaborationsController < ApplicationController

  def index
    @collaborations = Collaboration.all
  end

  def collaboration_params
    params.require(:collaboration).permit(:title, :description, :price, :category, :start_date, :end_date)
  end
end
