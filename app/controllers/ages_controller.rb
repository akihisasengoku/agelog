class AgesController < ApplicationController
  before_action :set_shop
  
  def create
    current_user.age(@shop)
  end

  def destroy
    current_user.unage(@shop)
  end
  
  private
  def set_shop
    @shop = Shop.find(params[:shop_id])
  end
end