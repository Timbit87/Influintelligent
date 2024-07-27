class SearchController < ApplicationController
  def index
    authorize :search, :index?
    @query = params[:query]
    @users = policy_scope(User).where('first_name ILIKE ? OR last_name ILIKE ? OR brand_name ILIKE ?', "%#{@query}%", "%#{@query}%", "%#{@query}%")
    @collaborations = policy_scope(Collaboration).where('title ILIKE ?', "%#{@query}%")
  end
end
