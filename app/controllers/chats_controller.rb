class ChatsController < ApplicationController



  def create
    @chat = current_customer.chats.new(chat_params)
    if @chat.save
      @chats = @chat.room.chats
    else
      @chats = @chat.room.chats
    end
  end

  def destroy
    @chat = Chat.find(params[:id])
    @chats = @chat.room.chats
    @chat.destroy
  end

  private

  def chat_params
    params.require(:chat).permit(:message, :room_id)
  end

end
