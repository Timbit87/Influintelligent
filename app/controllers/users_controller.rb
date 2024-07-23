class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]
  # this is influencers controller

  def index
    @influencers = User.where(brand: false)
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
    @influencers = User.where(brand: false)
    if @user.brand?
      @collaborations = Collaboration.where(user_id: @user.id).order(created_at: :desc)
      @collaborations_last_3 = @collaborations.limit(3)
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
