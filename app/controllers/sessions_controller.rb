class SessionsController < ApplicationController
  skip_before_action :authenticated, only: [:new, :create]

  def new
    # @user = User.new
  end

  def create
    user = User.find_by(nick_name: params[:user][:nick_name])
    user = user.try(:authenticate, params[:user][:password])
    if user
      session[:user_id] = user.id
      redirect_to user_path(user)
    else 
      redirect_to '/login'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/login'
  end

  
end
