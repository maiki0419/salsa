class PostComment < ApplicationRecord

  validates :comment, presence: true, length: {maximum: 100}

  belongs_to :customer
  belongs_to :post

  has_many :notifications, dependent: :destroy



end
