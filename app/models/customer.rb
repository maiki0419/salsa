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
  has_many :posts
  has_many :post_comments
  has_many :favorites

  # お気に入り登録した投稿を取得
  has_many :favorite_posts, through: :favorites, source: :post

  # フォロー機能アソシエーション
  has_many :relationships, foreign_key: :followed_id
  has_many :followers, through: :relationships, source: :followed
  has_many :revers_of_relationships, class_name: "Relationship", foreign_key: :followed_id
  has_many :followeds, through: :revers_of_relationships, source: :follower





  has_one_attached :profile_image

  # 画像がなかった場合、サイズ変更
  def get_profile_image(size)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path),filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize: size).processed
  end

 

end
