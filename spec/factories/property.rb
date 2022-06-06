FactoryBot.define do
  factory :property do
    name { Faker::Name.name }
    description { "hhdhdhdhhdhdhhdhdslssdkddskdk" }
    assets_type { Faker::Number.between(from: 0, to: 5) }
    purchase_date { Date.today }
    warranty_month { Faker::Number.between(from: 0, to: 120) }

    association :user, factory: :user

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