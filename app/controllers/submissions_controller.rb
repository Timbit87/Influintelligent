class SubmissionsController < ApplicationController

  #As an influencer, I can view my current collaborations

  def index
    @collaborations = Collaboration.all
  end

  def update
  end
end


resources :submissions, only: [:index, :update]
  # the accept/reject submission buttons are on the submissions index page
  # :destroy is not first priority
