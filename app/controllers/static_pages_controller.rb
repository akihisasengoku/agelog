class StaticPagesController < ApplicationController
  # before_filter :authenticate_user!, only: [:user_profile]
  before_action :setAllCategoriesAndAreas
  
  def home
    @age_id = Age.group(:shop_id).order('count_shop_id desc').limit(3).count(:shop_id).keys
    @age_shops = Shop.find(@age_id).sort_by{|i| @age_id.index(i.id)}
    
    
    @want_shops = Shop.all.sort_by{|shop|shop.ages.count}
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
