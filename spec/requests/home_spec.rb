require 'rails_helper'

RSpec.describe "HomeController", type: :request do 

  describe "GET #index" do

    it "is not accessible to unauthenticated users" do
      get root_path
      expect(response).to redirect_to(new_user_session_path)
    end

  end
  
  describe "get #wrong email" do 
    
    before do
      sign_in(create(:user,email: "hello@gmail.com"))
      get root_path
    end

  end

end