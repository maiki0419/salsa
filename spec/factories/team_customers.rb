FactoryBot.define do
  factory :team_customer do
    association :customer
    association :team
  end
end