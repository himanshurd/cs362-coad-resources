FactoryBot.define do 
  factory :user do
    sequence(:email) { |n| "person#{n}@email.com" }
    password { "password" }
    role { "organization" }
    organization
  end
  
  trait :admin_user do
    role {:admin}
  end

  trait :organization_user do
    role {'organization'}
    organization
  end
end