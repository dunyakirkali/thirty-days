FactoryGirl.define do
  factory :user do
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password }
    password_confirmation { |user| user.password }
    
    trait :with_plan do
      plan { Faker::Lorem.paragraph }
      began_at { DateTime.now }
      progress Array.new(30, false)
    end
    
    trait :without_plan do
      plan nil
      progress nil
    end
  end
end