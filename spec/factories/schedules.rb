FactoryBot.define do
  factory :schedule do
    title {Faker::Lorem.characters(number: 7)}
    association :team
  end
end