class SessionsController < ApplicationController
  before_action :logged_in_redirect, except: :destroy
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if( user && user.authenticate(params[:session][:password]))
      session[:user_id] = user.id
      flash[:success]= " Successfully logged in "
      redirect_to root_path
    else
      flash.now[:danger] = " You have enetred something  wrong "
      render 'new'
    end

  end

  def destroy
    session[:user_id]= nil
    flash[:success] = "Logged Out Success fully"
    redirect_to login_path
  end
  private
  def logged_in_redirect
    if logged_in?
      flash[:danger] = "You are already logged in"
      redirect_to root_path
    end
  end
end
