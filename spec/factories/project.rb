FactoryBot.define do
  factory :project do
    name { Faker::Name.name }
    association :organization, factory: :organization
  end
end
