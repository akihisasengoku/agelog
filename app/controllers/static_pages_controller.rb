class StaticPagesController < ApplicationController
  # before_filter :authenticate_user!, only: [:user_profile]
  before_action :setAllCategoriesAndAreas
  
  def home
    @age_shop_id = Age.group(:shop_id).order('count_shop_id desc').limit(10).count(:shop_id).keys
    @age_shops = Shop.find(@age_shop_id).sort_by{|i| @age_shop_id.index(i.id)}
    
    
    @want_shop_id = Want.group(:shop_id).order('count_shop_id desc').limit(10).count(:shop_id).keys
    @want_shops = Shop.find(@want_shop_id).sort_by{|i| @want_shop_id.index(i.id)}
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
