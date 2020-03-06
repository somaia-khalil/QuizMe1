class SessionsController < ApplicationController
  skip_before_action :authenticated, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(nick_name: params[:user][:nick_name])
    user = user.try(:authenticate, params[:user][:password])
    if user
      session[:user_id] = user.id
      redirect_to quizzes_path
    else
      flash[:errors] = ["Invalid Login"]
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to request.referrer
  end
  
end
