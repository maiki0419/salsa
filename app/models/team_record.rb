class TeamRecord < ApplicationRecord


  validates :team_id, presence: true
  validates :day, presence: true, length: {maximum: 10}
  validates :place, presence: true, length: {maximum: 20}
  validates :opponent, presence: true, length: {maximum: 20}
  validates :score, presence: true, length: {maximum: 10}
  validates :note, length: {maximum: 30}
  validates :result, presence: true, length: {maximum: 10}


  belongs_to :team

end
