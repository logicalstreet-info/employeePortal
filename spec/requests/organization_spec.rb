require 'rails_helper'

RSpec.describe "OrganizationsController", type: :request do
  let(:user) { create(:user) }
  before :each do
    sign_in(user)
  end

  let(:valid_attributes) { { name: Faker::Name.name, 
   weekly_off: "sunday"  }}

  describe "organization" do
    

    it "should show organization for super admin" do
      get organizations_path
      expect(response).to be_successful
    end

    it "should a show organization for admin" do
      get organizations_admin_index_path, params: { organization: 
        valid_attributes }, as: :turbo_stream
      expect(response).to be_successful
    end

    it "show the organization" do
      organization = create(:organization)
      get organization_path(organization)
      expect(response).to be_successful
    end
    
    it "for a name include" do
      get new_organization_path, params: { organization: 
        valid_attributes }, as: :turbo_stream
      expect(response.body).to include("name")
    end

    describe "POST /create" do
     
      it 'New Oraganization' do
        get new_organization_path
      end
      
      it 'Create Organization' do
        post organizations_path, params: { organization: valid_attributes.
          merge!(name: 'Google') }, as: :turbo_stream
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
        put organization_path(organization), params: { organization: 
          valid_attributes.merge!( name: 'Amazon' ) }, as: :turbo_stream
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