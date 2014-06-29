FactoryGirl.define do
  factory :user do
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(8) }
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
    
    trait :with_a_completed_plan do
      plan { Faker::Lorem.paragraph }
      began_at { DateTime.now - 31.days }
      progress Array.new(30, true)
    end
  end
end