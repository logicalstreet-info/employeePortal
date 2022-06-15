FactoryBot.define do
  factory :leave_day do
    holiday { "2022-07-03 00:00:00 UTC" }
    organization { Organization.first || create(:organization) }
  end
end