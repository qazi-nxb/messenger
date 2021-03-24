class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(params[:session][:username])
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
    flash[:success] = "Logged Out Sccess fully"
    redirect_to login_path
  end

end
