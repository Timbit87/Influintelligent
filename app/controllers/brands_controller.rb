class BrandsController < ApplicationController
  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      redirect_to brand_path(@brand)
    else
      render 'new'
    end
  end

  def brand_params
    params.require(:brand).permit(:name, :description)
  end
end