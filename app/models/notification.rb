class Notification < ApplicationRecord
  validates :vistor_id, presence: true
  validates :visited_id, presence: true
end
