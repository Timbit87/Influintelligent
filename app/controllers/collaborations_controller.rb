class CollaborationsController < ApplicationController
  def index
    @collaborations = Collaboration.all
  end

  def category
    @category = params[:category]
    @collaborations = Collaboration.where('category @> ARRAY[?]::varchar[]', [@category])
  end
end
