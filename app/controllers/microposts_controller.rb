class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    
    def create
        @micropost = current_user.microposts.build(micropost_params)
        if @micropost.save
            flash[:success] = "Micropost created!"
            redirect_to 'users/show'
        else
            render 'users/show'
        end
    end
    
    def destroy
        @micropost = current_user.microposts.find_by(id: params[:id])
        return redirect_to 'users/show' if @micropost.nil?
        @micropost.destroy
        flash[:success] = "Micropost deleted"
        redirect_to request.referrer || 'users/show'
    end
    
    private
    def micropost_params
        params.require(:micropost).permit(:content)
    end
end