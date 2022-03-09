class Relationship < ApplicationRecord


  validates :follower_id, presence: true
  validates :followed_id, presence: true

  belongs_to :follower, class_name: "Customer"
  belongs_to :followed, class_name: "Customer"

end
