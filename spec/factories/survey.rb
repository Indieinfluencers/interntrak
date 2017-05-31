FactoryGirl.define do
  factory :survey do
    name        "Really cool survey"
    description "Tell me what you think about that."
    association :author, factory: :user

    trait(:active)   { active true }
    trait(:inactive) { active false }
  end
end
