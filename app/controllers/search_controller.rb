class SearchController < ApplicationController
  def index
    @query = params[:query]
    @users = User.where('first_name ILIKE ? OR last_name ILIKE ? OR brand_name ILIKE ?', "%#{@query}%", "%#{@query}%", "%#{@query}%")
    @collaborations = Collaboration.where('title ILIKE ?', "%#{@query}%")
  end
end
