require 'rails_helper'

RSpec.describe "UsersController", type: :request do
  let(:user) { create(:user) }
  before :each do
    sign_in(user)
  end

  describe "user" do
    

    it "should show user" do
      get users_path
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

      it 'user redirect_url to' do
        redirect_url = "/users"
        skill = create(:skill)
        post employees_path, params: { user: 
         UserHelper.user_params(user).merge!( skills: skill), 
         redirect_url: redirect_url }
        expect(response.body).to redirect_to(redirect_url)
        expect(flash[:notice]).to match('User was successfully created.')
      end

    end

    describe "PATCH /User" do

      it 'Edit User' do
        user = create(:user)
        get edit_user_user_path(user)
      end
    
      it 'Update User' do
        user = create(:user)
        put user_path(user), params: { user: UserHelper.user_params(user).
          merge!( mobile_number: 2222222222 ) }
        expect(response.body).to redirect_to(users_path)
        expect(flash[:notice]).to match('User was successfully updated.')
      end


      it 'Update User' do
        user = create(:user)
        skill = create(:skill)
        patch update_user_user_path(user), params: { user: UserHelper.
          user_params(user).merge!( mobile_number: 2222222222, skills: skill ) }
        expect(response.body).to redirect_to(users_path)
        expect(flash[:notice]).to match('User was successfully updated.')
      end

      it 'invalid request' do
        user = create(:user)
        skill = create(:skill)
        patch update_user_user_path(user), params: 
         { user: UserHelper.user_params(user).
         merge!( mobile_number: nil, name: nil, skills: skill) }
        expect(response).to have_http_status(422)
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

    describe "organization" do
      
      it "not valid other organization user" do
        organization = create(:organization, name: :google)
        user2 = create(:user, organization: organization)
        get users_path
        expect(response).not_to include(user2.email)
      end

    end
    
  end

end 