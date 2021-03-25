class ChatboxController < ApplicationController
  def index
    if logged_in?
      @message = Message.new
      @msg = Message.all
    else
      flash[:danger] = "You should logged in first"
      redirect_to login_path
    end
  end
end
