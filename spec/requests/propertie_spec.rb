require 'rails_helper'

RSpec.describe 'PropertiesController', type: :request do
  let(:user) {create(:user)}
  before :each do
    sign_in(user)
  end

  let(:valid_attributes) { { name: 'My asset',
    description: 'my asset description', assets_type: "Laptop",
    purchase_date: Date.today, warranty_month: 2,
    organization_id: user.organization_id }}

  describe "property registration" do
    
    it "should show properties" do
      get properties_path
      expect(response).to be_successful
    end

    it 'shows New Assets Button' do
      get properties_index_path 
      expect(response.body).to include('Assets')
    end

    it 'check the description format value is right' do
      user.add_role(:admin)
      record = create(:property)
      get properties_index_path
      expect(response.body).to include(record.description.to_plain_text)
    end

    it 'check the warranty_monthe format value is right' do
      property = create(:property)
      get properties_index_path
      expect(response.body).to include(property.warranty_month.to_s)
    end

    describe "property index page" do
      
      it "if params of user and assets_type present" do
        record = create(:property)
        get properties_index_path(record), params: { user_id: user.id, assets_type: "Laptop"} 
        expect(response.body.to_s).to include(record.assets_type) 
      end

      it "if params of user present" do
        record = create(:property)
        get properties_index_path(record), params: { user_id: user.id} 
        expect(response.body.to_s).to include(record.user_id.to_s) 
      end

      it "if params of assets_type present" do
        record = create(:property)
        get properties_index_path, params: { assets_type: "Laptop" } 
        expect(response.body).to include(record.assets_type.to_s) 
      end

      it "defaults data are show" do
        record = create(:property)
        get properties_index_path
        expect(response.body).to include(record.assets_type.to_s) 
      end

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
        post properties_path, params: { property: valid_attributes },
          as: :turbo_stream
        expect(response.body).to redirect_to(properties_index_path)
        expect(flash[:notice]).to match('Property was successfully created.')
        expect(Property.last.name).to match('My asset')
      end

      it 'invalid request' do
        post properties_path, params: { property: valid_attributes.
          merge!( name: nil, description: nil, assets_type: nil, 
          purchase_date: Date.today, warranty_month: 2, 
          organization_id: user.organization_id ) }
        expect(response).to have_http_status(422)
      end
    
    end

    describe "PATCH /property" do

      it 'Edit property ' do
        property = create(:property)
        get edit_property_path(property)
      end
    
      it 'property' do
        property = create(:property)
        patch property_path(property), params: { property: valid_attributes.
          merge!( name: 'assests1' ) }, as: :turbo_stream
        expect(response.body).to redirect_to(properties_index_path)
        expect(flash[:notice]).to match('Property was successfully updated')
      end

      it 'invalid request' do
        property = create(:property)
        patch property_path(property), params: { property: valid_attributes.
          merge!( name: nil, description: nil, assets_type: nil, 
          purchase_date: Date.today, warranty_month: 2, 
          organization_id: user.organization_id ) }
        expect(response).to have_http_status(422)
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
