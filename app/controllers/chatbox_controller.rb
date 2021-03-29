class ChatboxController < ApplicationController
  #before_action :require_user

  def index
    if logged_in?
      @message = Message.new
      @messages = Message.all
    else
      flash[:danger] = "You should logged in first"
      redirect_to login_path
    end
  end
end
