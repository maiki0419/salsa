class Favorite < ApplicationRecord

  validates :customer_id, presence: true
  validates :post_id, presence: true
  validates_uniqueness_of :post_id, scope: :customer_id
  
  belongs_to :customer
  belongs_to :post

end
