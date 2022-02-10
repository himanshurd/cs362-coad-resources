FactoryBot.define do
  factory :ticket do
    name {"Fake Name"}
    description {"Fake Description"}
    phone {'+15032224567'}
    closed {false}
    region
    resource_category

    trait :closed do
      closed { true }
    end
  end
end