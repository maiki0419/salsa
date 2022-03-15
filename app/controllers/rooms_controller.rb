class RoomsController < ApplicationController

  def create

  end

  def show
    @customer = Customer.find(params[:id])
    # ログインユーザーが入室しているルームのidを取得
    @rooms = current_customer.customer_rooms.pluck(:room_id)
    # チャットをしたいユーザーが入室しているルームの中にログインユーザーが入室しているルームがないかさがす
    customer_rooms = CustomerRoom.find_by(customer_id: @customer.id, room_id: @rooms)
    # ルームがあればそのルームを使いなければ新たにルーム作成とCustomerRoomの作成を行う
    if customer_rooms.nil?
      @room = Room.new
      @room.save
      CustomerRoom.create(customer_id: @customer.id, room_id: @room.id)
      CustomerRoom.create(customer_id: current_customer.id, room_id: @room.id )
    else
      @room = customer_rooms.room
    end
    @chat = Chat.new
    @chats = @room.chats
    # ログインユーザーがチャットをしている会員のidを入れる配列
    @chat_customers_id = []
    @rooms.each do |room|
      # ログインユーザーの入室しているルームに結びついているCustomerRoom
      @customer_rooms = CustomerRoom.where(room_id: room)
      @customer_rooms.each do |customer_room|
        # CustomerRoomは二人分あるのでログインユーザーでない方のcustomer_idを@chat_customers_idに入れていく
        if customer_room.customer_id != current_customer.id
          @chat_customers_id << customer_room.customer_id
        end
      end
    end
    # @chat_customers_idからユーザーを探し@chot_customersに入れる
    @chat_customers = @chat_customers_id.map{ |n| Customer.find(n) }

  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to customer_path(current_customer.id)
  end

end
