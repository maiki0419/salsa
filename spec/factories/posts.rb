FactoryBot.define do
  factory :post do
    team_id {1}
    post_categroy {Faker::Lorem.characters(number: 7)}
    title {Faker::Lorem.characters(number: 7)}
    body {Faker::Lorem.characters(number: 100)}
    start_date {Faker::Lorem.characters(number: 7)}
    deadline {Faker::Lorem.characters(number: 7)}
    prefecture_id {Faker::Lorem.characters(number: 7)}
    city {Faker::Lorem.characters(number: 7)}
    capacity {Faker::Lorem.characters(number: 7)}
    place {Faker::Lorem.characters(number: 7)}
    association :customer
  end
end