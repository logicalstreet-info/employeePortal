FactoryBot.define do
  factory :bond do
    start_date { Date.today }
    end_date { Date.today + 1 }
    user { User.first || create(:user) }
    organization { Organization.first || create(:organization) }
  end
end