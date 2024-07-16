class UsersController < ApplicationController
  before_action :set_user, only: %i[show, edit, update, destroy]
  # this is influencers controller

  def index
    @influencers = User.where(brand: true)
    @brands = User.where(brand: true)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    if @user.brand?
      render 'brands/show'
    else
      render 'influencers/show'
    end
  end

  def edit
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :brand, :brand_name, :address, :contact, :websites, :social_links, :about, :tags)
  end

end
