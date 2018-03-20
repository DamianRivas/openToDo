FactoryBot.define do
  pw = "helloworld"

  factory :user do
    first_name "Damian"
    last_name "Rivas"
    
    sequence(:email){|n| "user#{n}@factory.com" }
    password pw
    password_confirmation pw
  end
end