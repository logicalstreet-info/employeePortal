FactoryBot.define do 
  factory :update do
    description { 'org1' }
    in_time { Time.now }
    out_time { Time.now + 2.hours }
    user { User.first || create(:user) }
    project { create(:project) }
  end
end