FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    mobile_number { 1111111111 }
    parent_mobile_number { 1111111111 }
    email { "#{Faker::Lorem.word}@hiclark.com" }
    password { 11111111 }
    password_confirmation { 11111111 }
    birth_date {Faker::Date.birthday(min_age: 18, max_age: 65)}
    organization { Organization.first || create(:organization) }
    
    trait :trainee do
      user_type { :trainee }
    end

    trait :employee do
      user_type { :employee }
    end

  end
end


