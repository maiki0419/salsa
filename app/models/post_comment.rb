class PostComment < ApplicationRecord


  validates :customer_id, presence: true
  validates :post_id, presence: true
  validates :comment, presence: true, length: {maximum: 100}

  belongs_to :customer
  belongs_to :post

  has_many :notifications, dependent: :destroy
  
 
  
end
