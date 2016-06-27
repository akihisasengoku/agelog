class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_search
  # include UsersHelper
  
  private
  def logged_in_user
    unless user_signed_in?
      stored_location
      flash[:danger] = 'Please log in'
      redirect_to login_url
    end
  end
  
  def set_request_from
    if session[:request_from]
      @request_from = session[:request_from]
    end
    # store current url
    session[:request_from] = request.original_url
  end
  
  def return_back
    if request.referer
      redirect_to :back and return true
    elsif @request_from
      redirect_to @request_from and return true
    end
  end

  def set_search
    #@search = Article.search(params[:q])
    @search = Form::Shop.ransack(params[:q]) #ransackメソッド推奨
    @search_shops = @search.result.includes(:categories)
  end
  
  
  protected
 
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:account_update) << :name
    end
  
end
