require 'rails_helper'

RSpec.describe "OrganizationsController", type: :request do
  let(:user) { create(:user) }
  before :each do
    sign_in(user)
  end

  describe "organization" do
    
    before do 
      @params = { 
        organization: { 
          name: Faker::Name.name, 
          weekly_off: "sunday"  
        } 
      }
    
    end

    it "should show organization" do
      get organizations_path, params: @params, as: :turbo_stream
      expect(response).to be_successful
    end
    
    it "for a name include" do
      get new_organization_path, params: @params, as: :turbo_stream
      expect(response.body).to include("name")
    end

    describe "POST /create" do
     
      it 'New Oraganization' do
        get new_organization_path
      end
      
      it 'Create Organization' do
        post organizations_path, params: { organization: { name: 'Google', weekly_off: "sunday" } }, as: :turbo_stream
        expect(response.body).to redirect_to(organizations_index_path)
        expect(flash[:notice]).to match("Organization was successfully created.")
        expect(Organization.last.name).to match('Google')
      end

    end

    describe "PATCH /organization" do

      it 'Edit Organization' do
        organization = create(:organization)
        get edit_organization_path(organization)
      end
    
      it 'Update Organization' do
        organization = create(:organization)
        put organization_path(organization), params: { organization: { name: 'Amazon' } }, as: :turbo_stream
        expect(response.body).to redirect_to(organizations_index_path)
        expect(flash[:notice]).to match('Organization was successfully updated')
      end
    
    end

    describe "DELETE /destroy" do
     
      it "delete Organization" do
        organization = create(:organization)
        delete organization_path(organization)
        expect(response.body).to redirect_to(organizations_index_path)
        expect(flash[:notice]).to match('Organization was successfully destroyed.')
      end
    end
    
  end

end 