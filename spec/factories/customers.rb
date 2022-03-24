FactoryBot.define do
  factory :customer, aliases: [:visited, :visitor, :follower, :followed] do
    nickname {Faker::Name.name}
    email {Faker::Internet.email}
    password {"1234567"}
    password_confirmation {"1234567"}
    prefecture_id {Faker::Lorem.characters(number: 5)}
    city {Faker::Lorem.characters(number: 5)}
    gender_id {Faker::Lorem.characters(number: 2)}
    age {Faker::Lorem.characters(number: 2)}
    introduction {Faker::Lorem.characters(number: 100)}
  end
end
