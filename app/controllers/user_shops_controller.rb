class UserShopsController < ApplicationController
  before_action :logged_in_user, :set_shop
  
  def create
    if params[:type] == "Want"
      current_user.want(@shop)
    elsif params[:type] == "Age"
      current_user.age(@shop)
    end
  end

  def destroy 
    if params[:type] == "Want"
      current_user.unwant(@shop)
    elsif params[:type] == "Age"
      current_user.unage(@shop)
    end
  end
  
  private
  def set_shop
    @shop = Shop.find(params[:shop_id])
  end
end