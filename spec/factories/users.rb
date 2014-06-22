FactoryGirl.define do
  factory :user do
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password }
    password_confirmation { |user| user.password } 
    
    trait :with_plan do
      plan { Faker::Lorem.paragraph }
    end
    
    trait :without_plan do
      plan nil
    end
  end
end