class Chat < ApplicationRecord
  validates :room_id, presence: true
  validates :customer_id, presence: true
  validates :message, presence: true, length: {maximum: 100}

  belongs_to :customer
  belongs_to :room

  has_many :notifications, dependent: :destroy

  def create_notification_chat!(current_customer, chat_id, visited_id)
    notification = current_customer.active_notifications.new(chat_id: chat_id, visited_id: visited_id, action: 'chat')

    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end

    notification.save if notification.valid?

  end

end
