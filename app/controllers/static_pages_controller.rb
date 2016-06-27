class StaticPagesController < ApplicationController
  # before_filter :authenticate_user!, only: [:user_profile]
  before_action :setAllCategoriesAndAreas
  
  def home
  end
  
  def introduce
  end
  
  def faq
  end
  
  def contact
  end
  
  def terms
  end
  
  def privacy
  end
  
  private
  def setAllCategoriesAndAreas
    @categories = Category.all
    @areas = Area.all
  end
end
