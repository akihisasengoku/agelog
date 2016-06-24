class UsersController < ApplicationController
    def edit_after_signup
    end
    
    def update_after_signup
    end
    
    def followings
        @user = User.find(params[:id])
        @following_users = @user.following_users
    end
  
    def followers
        @user = User.find(params[:id])
        @follower_users = @user.follower_users
    end
    
    def aged_shops
        @user = User.find(params[:id])
        @aged_shops = @user.age_shops
    end
    
    def wanted_shops
        @user = User.find(params[:id])
        @wanted_shops = @user.want_shops
    end
end