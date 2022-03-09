class Team < ApplicationRecord


  validates :name, presence: true
  validates :owner_id, presence: true
  validates :prefecture_id, length: {maximum: 10}
  validates :city, length: {maximum: 10}
  validates :level, length: {maximum: 10}
  validates :age, length: {maximum: 10}
  validates :member_count, length: {maximum: 10}
  validates :introduction, length: {maximum: 1000}
  validates :activities, length: {maximum: 10}
  validates :founded, length: {maximum: 10}
  has_one_attached :team_image

  has_many :team_customers
  has_many :schedules
  has_many :team_records

end
