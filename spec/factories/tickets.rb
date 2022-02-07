FactoryBot.define do
  factory :ticket do
    name {"Fake Name"}
    description {"Fake Description"}
    phone {"+15034564536"}
    organization_id {"Fake Org ID"}
    closed {false}
    resource_category_id {"Fake resource category ID"}
    region_id {"Fake Region ID"}
  end
end