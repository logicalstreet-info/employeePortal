require 'rails_helper'

RSpec.describe "PasswordsController", type: :request do
  let(:user) { create(:user) }
  before :each do
    sign_in(user)
  end

  describe "password" do
    
    before do 
      @params = { 
        user: { 
          password: 11111111, 
          password_confirmation: 11111111  
        } 
      }
    
    end

    it "for a password name include" do
      password = create(:user)
      get edit_password_path(password), params: @params, as: :turbo_stream
      expect(response.body).to include("password")
    end

    describe "PATCH /Password" do

      it 'User Can Edit Password' do
        password = create(:user)
        get edit_password_path(password)
      end
    
      it 'User create the Update Password' do
        password = create(:user)
        put password_path(password), params: { user: { password: 222222, password_confirmation: 222222 } }, as: :turbo_stream
        expect(response.body).to redirect_to(root_path)
        expect(flash[:notice]).to match('Your Password Is Successfully Updated!')
      end
    
    end

    describe "PATCH /Password" do

      it 'Admin can Edit the Password' do
        password = create(:user)
        get edit_password_password_path(password)
      end
    
      it 'Admin create the Update password' do
        password = create(:user)
        patch update_password_password_path(password), params: { user: { password: 333333, password_confirmation: 333333 } }, as: :turbo_stream
        expect(response.body).to redirect_to(users_path)
        expect(flash[:notice]).to match('Your User Password Is Successfully Updated!')
      end
    
    end
  
  end

end 