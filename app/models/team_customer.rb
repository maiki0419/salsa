class TeamCustomer < ApplicationRecord

  validates :customer_id, presence: true
  validates :team_id, presence: true


  belongs_to :customer
  belongs_to :team

end
