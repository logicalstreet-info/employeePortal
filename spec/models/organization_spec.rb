require "rails_helper"

RSpec.describe Organization, type: :model do

  context "validations" do

    before :each do
      @organization = create :organization
    end

    it 'should require a valid name' do
      expect(@organization).to be_valid
    end

    it "should require a name" do  
      organization = Organization.create(name: nil)
      expect(organization).to be_invalid
      expect(organization.errors.messages).to have_key(:name)
      expect(organization.errors.messages[:name]).to include("can't be blank")
    end

    it "should requires a unique name" do      
      organization = Organization.create(name: Faker::Name.name)
      expect(organization).to be_valid
    end
  
  end
end




