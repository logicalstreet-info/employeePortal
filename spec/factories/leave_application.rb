FactoryBot.define do
  factory :leave_application do
    from_date { Date.today }
    to_date { Date.today + 1 }
    description { 'Leave' }
    leave_type { :Personal }
    user { User.first || create(:user) }
    organization { Organization.first || create(:organization) }

    trait :Other do
      leave_type { :Other }
    end

    trait :Personal do
      leave_type { :Personal }
    end

    trait :Medical do
      leave_type { :Medical }
    end

    trait :Family_Emergency do
      leave_type { :Family_Emergency }
    end

    trait :Govt_Work do
      leave_type { :Govt_Work }
    end

    trait :Religious do
      leave_type { :Religious }
    end

    trait :Bad_Weathers do
      leave_type { :Bad_Weather }
    end

    trait :Maternity do
      leave_type { :Maternity }
    end

    trait :Occasional do
      leave_type { :Occasionals }
    end
  
  end
end