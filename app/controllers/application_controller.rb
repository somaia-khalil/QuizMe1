class ApplicationController < ActionController::Base
  before_action :current_user
  before_action :authenticated
  skip_before_action :authenticated, only: [:index]

  def current_user
    if session[:user_id]
      @current_user = User.find_by_id(session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end
     
  def logged_in?
    !!current_user
  end

  def authenticated
    redirect_to login_path unless logged_in?
  end

  def index
  end   

end
