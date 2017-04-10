FactoryGirl.define do
  factory :user do
    first_name "Robert"
    last_name "Paul"
    sequence(:email) { |n| "user#{n}@example.com" }
    password "password"
  end
end
