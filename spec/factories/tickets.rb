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
    trait :resource_category_id do 
      resource_category_id {nil}
    end
  end
end