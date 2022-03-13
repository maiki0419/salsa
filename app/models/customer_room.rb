class CustomerRoom < ApplicationRecord

  validates :customer_id, presence: true
  validates :room_id, presence: true

  belongs_to :customer
  belongs_to :room

end
