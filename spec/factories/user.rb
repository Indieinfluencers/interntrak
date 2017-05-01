FactoryGirl.define do
  factory :user do
    sequence(:email)  { |n| "user#{n}@example.com" }
    first_name        "Joe"
    last_name         "Pesci"
    password          "password"
  end
end
