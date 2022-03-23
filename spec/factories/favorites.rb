FactoryBot.define do
  factory :favorite do
    association :customer
    association :post
  end
end