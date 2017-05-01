FactoryGirl.define do
  factory :journal_entry do
    sequence(:content)  { |n| "Day #{n}: Still no signs of life. At least there's some food!" }
    date_for Date.today
    association :author, factory: :user
  end
end
