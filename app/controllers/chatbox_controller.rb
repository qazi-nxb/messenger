class ChatboxController < ApplicationController
  def index
    @msg = Message.all
  end
end
