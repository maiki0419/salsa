class ChatsController < ApplicationController



  def create
    @chat = current_customer.chats.create(chat_params)
    @customer_rooms = @chat.room.customer_rooms
    @customer_rooms.each do |customer_room|
      if current_customer.id != customer_room.customer_id
        @customer_id = customer_room.customer_id
      end
    end
    @chat.create_notification_chat!(current_customer, @chat.id, @customer_id)
    @chats = @chat.room.chats
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
