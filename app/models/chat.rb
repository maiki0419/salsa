class Chat < ApplicationRecord
  validates :room_id, presence: true
  validates :customer_id, presence: true
  validates :message, presence: true, length: {maximum: 100}

  belongs_to :customer
  belongs_to :room

end
