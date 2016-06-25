class StaticPagesController < ApplicationController
  before_filter :authenticate_user!, only: [:user_profile]
  def home
    @categories = Category.all
    @areas = Area.all
  end
  
end
