class BrandsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_brand, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def brand_params
    params.require(:brand).permit(:brand_name, :brand, :brand_description, :address, :contact, :websites, :social_links, :about, :tags)
  end

  def set_brand
    @brand = User.find(params[:id])
  end
end
