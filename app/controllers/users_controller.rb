class UsersController < ApplicationController
  before_filter :check_if_logged_in, :only => [:new, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to root_path
    else
      render 'new'
    end
  end

  def check_if_logged_in
    if !signed_in?
      redirect_to root_path
    end
  end
end
