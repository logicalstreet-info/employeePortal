FactoryBot.define do
  factory :role do
    name { :admin }
    resource_id { 1 }
    resource_type { 'User' }
  end
end