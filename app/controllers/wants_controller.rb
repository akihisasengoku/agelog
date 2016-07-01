class WantsController < ApplicationController
  before_action :set_shop
  
  def create
    current_user.want(@shop)
  end

  def destroy
    current_user.unwant(@shop)
  end
  
  private
  def set_shop
    @shop = Shop.find(params[:shop_id])
  end
end
