class PagesController < ApplicationController
  def home
    @collaborations = Collaboration.all
  end
end
