FactoryBot.define do
  factory :chat do
    message {Faker::Lorem.characters(number: 50)}
    association :customer
    association :room
  end
end