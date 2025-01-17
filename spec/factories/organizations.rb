FactoryBot.define do
  factory :organization do
    sequence(:name) { |n| "name#{n}" }
    sequence(:email) { |n| "person#{n}@email.com" }
    status {"approved"}
    phone {"+15037998087"}
    description {"fake organization"}
    rejection_reason {"No reason"}
    liability_insurance {"None"}
    primary_name {"Fake Primary Name"}
    secondary_name {"Fake Seondary Name"}
    secondary_phone {"+15034567890"}
    title {"Fake Org Title"}
    transportation{"yes"}

    trait :set_submitted do 
      status {:submitted}
    end

    trait :set_rejected do
      status {:rejected}

    end
  end
end