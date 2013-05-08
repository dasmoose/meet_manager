class SessionsController < ApplicationController
    def new 

    end

    def create 
      user = User.find_by_user_name(params[:session][:username])
      if user && user.authenticate(params[:session][:password])
        sign_in user
        redirect_to meets_path
      else 
        render 'new'
      end
    end

  def destroy 
    sign_out
    redirect_to root_path
  end

end
