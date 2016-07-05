class MicrostarsController < ApplicationController
  before_action :set_micropost
  
  def create
    current_user.microstar(@micropost)
    updateNewShopImage(@micropost)
    # @microstars = Microstar.where(micropost_id: params[:micropost_id])
    # @micropost = Micropost.find_by(micropost_id: params[:micropost_id])
    
  end

  def destroy
    current_user.unmicrostar(@micropost)
    # @microstars = Microstar.where(micropost_id: params[:micropost_id])
    # @micropost = Micropost.find_by(micropost_id: params[:micropost_id])
    # @micrposts = Micropost.all
  end
  
  
  private
  def set_micropost
    @micropost = Micropost.find(params[:micropost_id])
  end
  # @age_shop_id = Age.group(:shop_id).order('count_shop_id desc').limit(10).count(:shop_id).keys
  # @age_shops = Shop.find(@age_shop_id).sort_by{|i| @age_shop_id.index(i.id)}
  def updateNewShopImage(micropost)
    microstar_count = micropost.star_users.count
    shop = micropost.shop
    if micropost.image.present?
      if shop.mainimage.nil? || microstar_count > shop.microposts.find(:all, :condition => ['mainimage NOT ?', nil]).limit(1).order('microstars_count desc').microstar_count
        shop.update_attribute(:mainimage, micropost.image)
      end
    end
  end
end
