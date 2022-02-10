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
    trait :organization_id do 
      organization_id {5}
    end
    trait :region_id
    region_id nil
  end
end