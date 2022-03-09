class Schedule < ApplicationRecord

  validates :team_id, presence: true
  validates :title, presence: true, length: {maximum: 20}

  belongs_to :team
end
