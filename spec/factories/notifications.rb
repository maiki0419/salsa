FactoryBot.define do
  factory :notification do
    action {""}
    checked {Faker::Boolean.boolean}
    association :visitor
    association :visited
    association :post
    association :comment
  end
end