require 'rails_helper'

RSpec.describe "BondController", type: :request do
  
  let(:user) {create(:user)}
  before :each do
    sign_in(user)
  end

  let(:valid_attributes) { { start_date: Date.today,          
    end_date: Date.today + 1, description: "bond", 
    user_id: user.id, organization_id: user.organization_id} }

  describe "Bond" do
    
    describe "index/" do 
    
      it 'index bond' do
        feature_flag = create(:feature_flag, employee_bond: "on",
         organization_id: user.organization_id)
        get bonds_path(feature_flag)
        expect(response).to be_successful
      end

      it 'invalid request' do
        get "/bonds"
        expect(response.body).to redirect_to(root_path)
      end

    end

    describe "POST /create" do
     
      it 'New Bond' do
        get new_bond_path
      end
      
      it 'Create Bond' do
        post bonds_path, params: { bond: valid_attributes }
        expect(response.body).to redirect_to(bonds_path)
        expect(flash[:notice]).to match("Bond Sucessfully Created")
        expect(Bond.last.start_date).to match(Date.today)
      end
 
      it 'invalid request' do
        post bonds_path, params: { bond: valid_attributes.
          merge!( start_date: nil, end_date: nil, description: "bond") }
        expect(response).to have_http_status(422)
      end
      
    end

    describe "PATCH /bond" do

      it 'Edit bond' do
        bond = create(:bond)
        get edit_bond_path(bond)
      end
    
      it 'update bond' do
        bond = create(:bond)
        put bond_path(bond), params: { bond: valid_attributes.
          merge!( end_date: Date.today + 3 ) }
        expect(response.body).to redirect_to(bonds_path)
        expect(flash[:notice]).to match('Bond Sucessfully updated')
      end

      it 'invalid request' do
        bond = create(:bond)
        put bond_path(bond), params: { bond: valid_attributes.
        merge!( start_date: Date.today, end_date: nil, description: "bond" )}
        expect(response).to have_http_status(422)
      end
  
    end

    describe "DELETE /destroy" do
     
      it "delete Bond" do
        bond = create(:bond)
        delete bond_path(bond)
        expect(response.body).to redirect_to(bonds_path)
        expect(flash[:notice]).to match('Bond was successfully destroyed.')
      end
    end
    
  end

end 
