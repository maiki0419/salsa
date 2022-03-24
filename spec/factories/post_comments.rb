FactoryBot.define do
  factory :post_comment do
    comment {Faker::Lorem.characters(number: 50)}
    association :customer
    association :post
  end
end