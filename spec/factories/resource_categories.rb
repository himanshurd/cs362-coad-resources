FactoryBot.define do
  factory :resource_category do
    name {"Fake Name"}
    # sequence(:name) { |n| "Fake resource_category #{n}"}
  end
end