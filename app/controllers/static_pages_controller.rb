class StaticPagesController < ApplicationController
  before_filter :authenticate_user!, only: [:user_profile]
  def home
    
  end
  
  def user_profile
    
  end
end
