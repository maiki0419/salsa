class Schedule < ApplicationRecord

  validates :team_id, presence: true
  validates :title, presence: true, length: {maximum: 20}
  validate :start_end
  belongs_to :team

  def start_end
    if starts_at > ends_at
      errors.add(:starts_at, "予定終了は予定開始より後の日時を入力してくだい。")
    end
  end

end
