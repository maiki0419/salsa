FactoryBot.define do
  factory :team_record do
    day {Faker::Lorem.characters(number: 7)}
    place {Faker::Lorem.characters(number: 15)}
    opponent {Faker::Lorem.characters(number: 10)}
    score {Faker::Lorem.characters(number: 7)}
    note {Faker::Lorem.characters(number: 7)}
    result {Faker::Lorem.characters(number: 1)}
    association :team
  end
end