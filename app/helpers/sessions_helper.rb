module SessionsHelper
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
    def logged_in?
        !!current_user
    end
    
    def stored_location
        session[:forwarding_url] = request.url if request.get?
    end
    
    def log_out
        session.delete(:user_id)
        @current_user = nil
      end
end
