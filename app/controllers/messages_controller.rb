class MessagesController < ApplicationController
  before_action :require_user
  def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast "chatroom_channel",
                                   msg_data: render_data(message)
    end
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end

  def render_data(message)
    render( partial: 'layouts/chatmsg', locals: { msg: message })

  end

end