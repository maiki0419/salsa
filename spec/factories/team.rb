FactoryBot.define do
  factory :team do
    name {Faker::Lorem.characters(number: 5)}
    owner_id {1}
    prefecture_id {Faker::Lorem.characters(number: 5)}
    city {Faker::Lorem.characters(number: 5)}
    level {Faker::Lorem.characters(number: 7)}
    age {Faker::Lorem.characters(number: 7)}
    member_count {Faker::Lorem.characters(number: 3)}
    introduction {Faker::Lorem.characters(number: 100)}
    activities_time {Faker::Lorem.characters(number: 10)}
    founded {Faker::Lorem.characters(number: 7)}
  end
end