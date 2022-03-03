FactoryBot.define do
  factory :resource_category do
    sequence(:name) { |n| "Fake Resource Category#{n}"}
  end
end