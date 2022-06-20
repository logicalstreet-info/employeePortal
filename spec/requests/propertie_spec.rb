require 'rails_helper'

RSpec.describe 'PropertiesController', type: :request do
  let(:user) {create(:user)}
  before :each do
    sign_in(user)
  end
  
  describe "property registration" do
    before do
      @params = {
        property: {
          name: 'My asset',
          description: 'my asset description',
          assets_type: :LED,
          purchase_date: Date.today,
          warranty_month: 2,
          organization_id: user.organization_id
        }
      }
    end
    

    it "should show properties" do
      get properties_path, params: @params, as: :turbo_stream
      expect(response).to be_successful
    end

    it 'shows New Assets Button' do
      get properties_index_path 
      expect(response.body).to include('Assets')
    end

    it 'check the description format value is right' do
      user.add_role(:admin)
      record = create(:property)
      get properties_index_path, params: {}, as: :turbo_stream
      expect(response.body).to include(record.description.to_plain_text)
    end

    it 'check the warranty_monthe format value is right' do
      property = create(:property)
      get properties_index_path, params: {}, as: :turbo_stream
      expect(response.body).to include(property.warranty_month.to_s)
    end


    
    describe "GET/ new property page" do
      
      it 'for a new property form' do
        get new_property_path
        expect(response.body).to include("Assets")
      end
      
      it "show a name label" do
        get new_property_path
        expect(response.body).to include("name")
      end

      it "show a description label" do
        get new_property_path
        expect(response.body).to include("description")
      end

      it "show a assests_type form" do
        get new_property_path
        expect(response.body).to include("assets_type")
      end

      it "show a purchase_date form" do
        get new_property_path
        expect(response.body).to include("purchase_date")
      end

      it "show a warranty month form" do
        get new_property_path
        expect(response.body).to include("warranty_month")
      end 

    end

    describe "POST /create" do
      
      it 'New Property' do
        get new_property_path
      end
      
      it 'Create property' do
        post properties_path, params: @params, as: :turbo_stream
        expect(response.body).to redirect_to(properties_index_path)
        expect(flash[:notice]).to match('Property was successfully created.')
        expect(Property.last.name).to match('My asset')
      end
    
    end

    describe "PATCH /property" do

      it 'Edit property ' do
        property = create(:property)
        get edit_property_path(property)
      end
    
      it 'property' do
        # user.add_role(:admin)
        property = create(:property)
        patch property_path(property), params: { property: { name: 'assests1' } }, as: :turbo_stream
        expect(response.body).to redirect_to(properties_index_path)
        expect(flash[:notice]).to match('Property was successfully updated')
      end
    
    end

    describe "DELETE /destroy" do
     
      it "delete Property" do
        property = create(:property)
        delete property_path(property)
        expect(response.body).to redirect_to(properties_index_path)
        expect(flash[:notice]).to match('Property was successfully destroyed.')
      end
    end

  end
end
