require 'rails_helper'

RSpec.describe 'PropertiesController', type: :request do
  before do
    sign_in(create(:user))
  end

  describe "property registration" do
    before do
      @params = {
        property: {
          name: Faker::Name.name,
          description: "properties",
          assets_type: Faker::Number.between(from: 0, to: 5),
          purchase_date: Date.today,
          warranty_month: Faker::Number.between(from: 0, to: 120)
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
      record = create(:property)
      get properties_index_path, params: {}, as: :turbo_stream
      expect(response.body).to include(record.description.to_plain_text)
    end

    it 'check the warranty_monthe format value is right' do
      property = create(:property)
      get properties_index_path, params: {}, as: :turbo_stream
      expect(response.body).to include(property.warranty_month.to_s)
    end

  end
    
  describe "GET/ new property page" do
    before do
      @params = {
        property: {
          name: Faker::Name.name,
          description: "properties",
          assets_type: Faker::Number.between(from: 0, to: 5),
          purchase_date: Date.today,
          warranty_month: Faker::Number.between(from: 0, to: 120)
        },
      format: :turbo_stream
      }
      get new_property_path
    end
    
    it 'for a new property form' do
      expect(response.body).to include("Assets")
    end
    
    it "show a name label" do
      expect(response.body).to include("name")
    end

    it "show a description label" do
      expect(response.body).to include("description")
    end

    it "show a assests_type form" do
      expect(response.body).to include("assets_type")
    end

    it "show a purchase_date form" do
      expect(response.body).to include("purchase_date")
    end

    it "show a warranty month form" do
      expect(response.body).to include("warranty_month")
    end 

  end
end
