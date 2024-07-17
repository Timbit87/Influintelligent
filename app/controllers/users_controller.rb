class UsersController < ApplicationController
  before_action :set_influencer, only: %i[show edit update destroy]

  def index
    @influencers = User.influencer.all
  end

  def show
    @influencers = User.influencer.all

  end

  def edit
  end

  def update
  end

  def destroy
    @influencer.destroy
  end

  private

  def set_influencer
    @influencer = User.influencer.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :brand, :brand_name, :address, :contact, :websites, :social_links, :about, :tags)
  end

end
