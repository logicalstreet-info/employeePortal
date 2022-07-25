FactoryBot.define do
  factory :property do
    name { Faker::Name.name }
    description { "properties" }
    assets_type { "Laptop" }
    purchase_date { Date.today }
    user { User.first || create(:user) }
    organization { Organization.first || create(:organization) }
    warranty_month { Faker::Number.between(from: 0, to: 120) }
    
    # association :user, factory: :user

    trait :Laptop do
      assets_type { :Laptop }
    end

    trait :LED do
      assets_type { :LED }
    end

    trait :Mouse do
      assets_type { :Mouse }
    end

    trait :Keyboard do
      assets_type { :Keyboard }
    end

    trait :CPU do
      assets_type { :CPU }
    end

    trait :cable do
      assets_type { :cable }
    end
  
  end
end