class ApplicationController < ActionController::Base
    before_action :authenticated
    skip_before_action :authenticated, only: [:index]

    def current_user
        if session[:user_id]
           user = User.find_by_id(session[:user_id])
           if !!user
             user
           elsif
             session[:user_id] = nil
           end
        end
    end
    
    def logged_in?
        !!current_user
    end


   def index
   end   


    def logged_in?
        !!current_user
    end

    def authenticated
        redirect_to login_path unless logged_in?
    end


    

end
