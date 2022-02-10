FactoryBot.define do
  factory :resource_category do
    sequence(:name) { |n| "Fake resource_category #{n}"}
  end
end