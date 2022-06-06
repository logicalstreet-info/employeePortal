require "rails_helper"

RSpec.describe Project, type: :model do

  context "validations" do

    before :each do
      @project = create :project
    end
     
    it "should relate to a Business" do
      expect(@project).to respond_to(:organization)
      expect(@project.organization).to be_a(Organization)
    end

    it "should require a name" do  
      project = Project.create(name: nil, organization_id: nil)
      expect(project).to be_invalid
      expect(project.errors.messages[:name]).to include("can't be blank")
    end
  
  end

end
