class Team < ApplicationRecord


  validates :name, presence: true
  validates :owner_id, presence: true
  validates :prefecture_id, length: {maximum: 10}
  validates :city, length: {maximum: 10}
  validates :level, length: {maximum: 10}
  validates :age, length: {maximum: 10}
  validates :member_count, length: {maximum: 10}
  validates :introduction, length: {maximum: 1000}
  validates :activities_time, length: {maximum: 10}
  validates :founded, length: {maximum: 10}
  has_one_attached :team_image

  has_many :schedules
  has_many :team_records
  has_many :team_customers

  def get_team_image(size)
    unless team_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      team_image.attach(io: File.open(file_path),filename: "default.jpg", content_type: 'image/jpeg')
    end
    team_image.variant(resize: size).processed
  end

  def owner_name(owner_id)
    Customer.find(owner_id).nickname
  end

end
