require 'rails_helper'

RSpec.describe "HomeController", type: :request do 

  let(:user) {create(:user)}
  before :each do
    sign_in(user)
  end
  
  describe "get #wrong email" do 
    before do
      sign_in(create(:user,email: "hello@gmail.com"))
      get root_path
    end
  end

  describe "show the home page" do
    
    before :each do
      sign_in(create(:user))
    end

    it "for show the daily update" do
      get root_path
      expect(response.body).to include("Daily Update")
    end

    it "for show the assets" do
      get root_path
      expect(response.body).to include("Assets")
    end

    it "for show the project" do
      get root_path
      expect(response.body).to include("Project")
    end
   
    it "for show the notification" do
      get root_path
      expect(response.body).to include("Notification")
    end

    it "for show the Chat" do
      get root_path
      expect(response.body).to include("Chat")
    end

    it "for show the Leaves" do
      get root_path
      expect(response.body).to include("Leaves")
    end

    it "for show the Count total leave" do
      get root_path
      expect(response.body).to include("Count total leave")
    end


  end

  describe "show the home page" do

    describe "get admin page" do

      it "show the admin name in home page" do
        user.add_role(:admin)
        get root_path, params: {}, as: :turbo_stream
        expect(response.body).to include("Admin")
      end 
      
      it "show the admin name in home page" do
        user.add_role(:admin)
        get root_path, params: {}, as: :turbo_stream
        expect(response.body).to include(user.name)
      end

      it "show the admin email in home page" do
        user.add_role(:admin)
        get root_path, params: {}, as: :turbo_stream
        expect(response.body).to include(user.email)
      end

      it "show the admin organization name in home page" do
        user.add_role(:admin)
        get root_path, params: {}, as: :turbo_stream
        expect(response.body).to include(user.organization.name)
      end

    end

  end
end