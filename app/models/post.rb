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
  has_many :favorite_customers, through: :favorites, source: :customer
  has_many :notifications, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

# お気に入りしているかどうか調べる
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end


  def team_name(team_id)
    Team.find(team_id).name
  end


  # お気に入り通知
  def create_notification_like!(current_customer)
    # 既にお気に入りされているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and post_id = ? and action = ?", current_customer.id, customer_id, id, 'like'])
    # お気に入りされていない場合通知レコードを作成
    if temp.blank?
      notification = current_customer.active_notifications.new(post_id: id, visited_id: customer_id, action: 'like')
      # 自分の投稿の場合は通知済みにする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      # 後置if　バリデーションが合格であればセーブを行う
      notification.save if notification.valid?
    end
  end


  # コメントをしている人全てに通知を送る
  def create_notification_comment!(current_customer, post_comment_id)
    # 自分以外にコメントしている人を全て取得し、通知を送る
    temp_ids = PostComment.select(:customer_id).where(post_id: id).where.not(customer_id: current_customer.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_customer, post_comment_id, temp_id['customer_id'])
    end
    # 誰もコメントしていない場合は投稿者に通知を送る
    save_notification_comment!(current_customer, post_comment_id, customer_id) if temp_ids.blank?
  end


  # コメント通知
  def save_notification_comment!(current_customer, post_comment_id, visited_id)
    notification = current_customer.active_notifications.new(post_id: id, post_comment_id: post_comment_id, visited_id: visited_id, action: 'comment')
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end


  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old_|
      self.tags.delete Tag.find_by(name: old)
    end

    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      self.tags << new_post_tag
    end

  end

end
