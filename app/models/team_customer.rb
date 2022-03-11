class TeamCustomer < ApplicationRecord

  validates :customer_id, presence: true
  validates :team_id, presence: true


  belongs_to :customer
  belongs_to :team

  def team_name(team_id)
    Team.find(team_id).name
  end
end



@user_events = @user.events