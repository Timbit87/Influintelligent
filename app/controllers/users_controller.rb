class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
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

  # def show
  #   @influencers = User.where(brand: false)
  #   if @user.brand?
  #     @collaborations = Collaboration.where(user_id: @user.id).order(created_at: :desc)
  #     @collaborations_last_3 = @collaborations.limit(3)
  #     render 'brands/show'
  #   else
  #     render 'influencers/show'
  #     @instagram_followers = InstagramScraper.get_followers(@user.instagram_username) if @user.instagram_username.present?
  #     @twitter_followers = TwitterScraper.get_followers(@user.twitter_username) if @user.twitter_username.present?
  #     @youtube_followers = YoutubeScraper.get_followers(@user.youtube_channel_id) if @user.youtube_channel_id.present?
  #     @tiktok_followers = TiktokScraper.get_followers(@user.tiktok_username) if @user.tiktok_username.present?
  #   end
  # end
  
  def show
    @influencers = User.where(brand: false)
    @social_followers = {}
    if @user.brand?
      @collaborations = Collaboration.where(user_id: @user.id).order(created_at: :desc)
      @collaborations_last_3 = @collaborations.limit(3)
      render 'brands/show'
    else
      if @user.social_links.present?
        @user.social_links.each do |platform, identifier|
          begin
            username = identifier.split('/').last.split('?').first  # Extraindo apenas o nome de usuário
            followers_count = SocialMediaScraper.get_followers(platform, username)
            puts "#{platform.capitalize} followers: #{followers_count}"
            @social_followers[platform] = followers_count
          rescue StandardError => e
            puts "#{platform.capitalize} error for #{identifier}: #{e.message}"
            @social_followers[platform] = "Error: #{e.message}"
          end
        end
      end
      render 'influencers/show'
    end
  end
  

  def edit
    @socials = @user.social_links
  end

  def update
    if @user.update(user_params.merge(social_links: social_params))
      redirect_to user_path(@user), notice: "Profile was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar, :brand, :brand_name, :address, :contact, :website, :social_links, :about, :tags)
  end

  def social_params
    params.require(:social_links).permit(:twitter, :facebook)
  end
end
