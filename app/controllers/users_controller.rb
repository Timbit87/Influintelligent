class UsersController < ApplicationController
  before_action :set_influencer, only: %i[index, new, show, edit]
  # this is influencers controller

  def index
    @influencers = User.where(brand: true)
  end

  def new
  end

  def create
    @influencer = User.new
    @influencer.save
  end

  def show
  end

  def edit
  end

  private

  def set_influencer
    @influencer = User.find(params[:id])
  end

end
