module UserHelper

  def self.user_params(user)
    {
      name: Faker::Name.name,
      mobile_number: 1111111111, 
      parent_mobile_number: 1111111111,
      email: "#{Faker::Lorem.word}@gmail.com",
      password: 11111111,
      password_confirmation: 11111111,
      organization_id: user.organization_id,
      employee_positions: "junior"
    }
  end
end