FactoryBot.define do
  factory :taggable do
    association :user, factory: :user
    association :skill, factory: :skill
  end
end