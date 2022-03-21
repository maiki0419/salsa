class PostTag < ApplicationRecord

  validates :tag_id, presence: true
  validates :post_id, presence: true

  belongs_to :tag
  belongs_to :post
end
