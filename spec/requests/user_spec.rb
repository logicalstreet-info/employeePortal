require 'rails_helper'

RSpec.describe "UsersController", type: :request do
  let(:user) { create(:user) }
  before :each do
    sign_in(user)
  end

  describe "user" do
    
    before do 
      @params = { 
        user: { 
          name: Faker::Name.name,
          mobile_number: 1111111111, 
          parent_mobile_number: 1111111111,
          email: "#{Faker::Lorem.word}@hiclark.com",
          password: 11111111,
          password_confirmation: 11111111,
          organization_id: user.organization_id 
        }
      }
    
    end

    it "should show user" do
      get users_path, params: @params
      expect(response).to be_successful
    end

    it "show the user" do
      user = create(:user)
      get user_path(user)
      expect(response).to be_successful
    end
    
    describe "new form validation" do 
      it "for a name include" do
        get new_user_path
        expect(response.body).to include("name")
      end

      it "for a Gender include" do
        get new_user_path
        expect(response.body).to include("Gender")
      end

      it "for a user_type include" do
        get new_user_path
        expect(response.body).to include("user_type")
      end

      it "for a Email include" do
        get new_user_path
        expect(response.body).to include("Email")
      end

      it "for a password include" do
        get new_user_path
        expect(response.body).to include("password")
      end

      it "for a Qualification include" do
        get new_user_path
        expect(response.body).to include("Qualification")
      end

      it "for a Birth_Date include" do
        get new_user_path
        expect(response.body).to include("Birth date")
      end

      it "for a Joining_Date include" do
        get new_user_path
        expect(response.body).to include("Joining date")
      end

      it "for a Mobile_number include" do
        get new_user_path
        expect(response.body).to include("Mobile_number")
      end

      it "for a Parent_mobile_number include" do
        get new_user_path
        expect(response.body).to include("Parent_mobile_number")
      end

      it "for a address include" do
        get new_user_path
        expect(response.body).to include("address")
      end
      
      it "for a native_address include" do
        get new_user_path
        expect(response.body).to include("native_address")
      end

      it "for a Add button include" do
        get new_user_path
        expect(response.body).to include("Add")
      end

    end

    describe "POST /create" do
     
      it 'New User' do
        get new_user_path
      end

    end

    describe "PATCH /User" do

      it 'Edit User' do
        user = create(:user)
        get edit_user_path(user)
      end
    
      it 'Update User' do
        user = create(:user)
        put user_path(user), params: { user: { mobile_number: 2222222222 } }
        expect(response.body).to redirect_to(users_path)
        expect(flash[:notice]).to match('User was successfully updated.')
      end

      it 'Update User' do
        user = create(:user)
        patch update_user_user_path(user), params: { user: { mobile_number: 2222222222 } }
        expect(response.body).to redirect_to(users_path)
        expect(flash[:notice]).to match('User was successfully updated.')
      end
    
    end

    describe "DELETE /destroy" do
     
      it "delete User" do
        user = create(:user)
        delete user_path(user)
        expect(response.body).to redirect_to(users_index_path)
        expect(flash[:notice]).to match('User was successfully destroyed.')
      end
    end

    describe "User Profile" do
    
      it "show the user details" do
        user = create(:user)
        leave = create(:leave_application, user: user)
        property = create(:property, user: user)
        get user_profile_user_path(user)
        expect(response.body).to include(user.email)
        expect(response.body).to include(leave.user.email)
        expect(response.body).to include(property.user.email)
      end
      
    end
    
  end

end 