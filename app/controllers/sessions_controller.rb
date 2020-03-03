class SessionsController < ApplicationController
  def new
    # @user = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name_nick])
    # user = User.try(:authenticate, params[:user][:password])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = user.id
      
      redirect_to '/user/show'
    else 
      redirect_to '/sessions/new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/login'
  end

  
end
