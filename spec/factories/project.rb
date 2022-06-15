FactoryBot.define do
  factory :project do
    name { "My project" }
    organization { Organization.first || create(:organization) }
  end
end
