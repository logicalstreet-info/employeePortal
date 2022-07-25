require 'rails_helper'

RSpec.describe "PasswordsController", type: :request do
  let(:user) { create(:user) }
  before :each do
    sign_in(user)
  end

  let(:valid_attributes) { { password: 11111111, 
    password_confirmation: 11111111 }}
  
  describe "password" do
    
    it "for a password name include" do
      password = create(:user)
      get edit_password_path(password), params: { password: 
        valid_attributes }, as: :turbo_stream
      expect(response.body).to include("password")
    end

    describe "PATCH /Password" do

      it 'User Can Edit Password' do
        password = create(:user)
        get edit_password_path(password)
      end
    
      it 'User create the Update Password' do
        password = create(:user)
        put password_path(password), params: { user: valid_attributes.
          merge!(password: 222222, password_confirmation: 222222 ) },
          as: :turbo_stream
        expect(response.body).to redirect_to(root_path)
        expect(flash[:notice]).to match('Your Password Is Successfully Updated!')
      end

      it 'invalid request' do
        password = create(:user)
        put password_path(password), params:  { user: valid_attributes.
          merge!(password: nil, password_confirmation: 222222 ) }
        expect(response).to have_http_status(422)
      end

    end

    describe "PATCH /Password" do

      it 'Admin can Edit the Password' do
        password = create(:user)
        get edit_password_password_path(password)
      end
    
      it 'Admin create the Update password' do
        password = create(:user)
        patch update_password_password_path(password), params: { user: 
          valid_attributes.merge!( password: 333333, 
          password_confirmation: 333333 ) }, as: :turbo_stream
        expect(response.body).to redirect_to(users_path)
        expect(flash[:notice]).to match('Your User Password Is Successfully Updated!')
      end

      it 'invalid request' do
        password = create(:user)
        patch update_password_password_path(password), params: { user: 
          valid_attributes.merge!( password: nil, password_confirmation: 333333 ) }
        expect(response).to have_http_status(422)
      end

    end
  
  end

end 