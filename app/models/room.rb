class Room < ApplicationRecord

  has_many :customer_rooms, dependent: :destroy
  has_many :chats, dependent: :destroy
  
  
  
  def create_notification_chat!(current_customer)
    
  end

end
