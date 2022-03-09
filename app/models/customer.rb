class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :nickname, presence: true, length: {maximum: 10}
  validates :prefecture_id, length: {maximum: 10}
  validates :city, length: {maximum: 10}
  validates :gender_id, length: {maximum: 10}
  validates :age, length: {maximum: 10}
  validates :introduction, length: {maximum: 1000}

  has_many :customer_rooms
  has_many :chats
  has_many :team_customers
  has_many :favorites
  has_many :posts
  has_many :post_comments

  # フォロー機能アソシエーション
  has_many :relationships, foreign_key: :followed_id
  has_many :followers, through: :relationships, source: :followeds
  has_many :revers_of_relationships, class_name: "Relationship", foreign_key: :followed_id
  has_many :followeds, through: :revers_of_relationships, source: :followers



  has_one_attached :profile_image
end
