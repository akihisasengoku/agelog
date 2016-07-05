class MicrostarsController < ApplicationController
  before_action :set_micropost
  
  def create
    current_user.microstar(@micropost)
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
end
