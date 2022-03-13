class Post < ApplicationRecord

  validates :customer_id, presence: true
  validates :post_categroy, presence: true
  validates :title, presence: true, length: {maximum: 20}
  validates :body, length: {maximum: 1000}
  validates :start_date, length: {maximum: 10}
  validates :deadline,presence: true, length: {maximum: 10}
  validates :prefecture_id,presence: true, length: {maximum: 10}
  validates :city, length: {maximum: 10}
  validates :capacity, length: {maximum: 10}
  validates :place,  length: {maximum: 20}

  belongs_to :customer
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end


  def team_name(team_id)
    Team.find(team_id).name
  end


end
