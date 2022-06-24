require 'rails_helper'

RSpec.describe "LeaveDaysController", type: :request do
  let(:user) { create(:user) }
  before :each do
    sign_in(user)
  end

  describe "leave_day" do
    
    before do 
      @params = { 
        leave_day: { 
          holiday: "2022-07-03 00:00:00 UTC", 
          organization_id: user.organization_id 
        } 
      }
    
    end

    it "should show leave_day" do
      get leave_days_path
      expect(response).to be_successful
    end
    
    it "for a leave_day holiday" do
      # user =  create(:user)
      get new_leave_day_path, params: @params, as: :turbo_stream
      expect(response.body).to include("holiday")
    end

    describe "POST /create" do
     
      it 'New leave_day ' do
        get new_leave_day_path
      end
      
      it 'Create leave_day' do
        post leave_days_path, params: @params, as: :turbo_stream
        expect(response.body).to redirect_to(leave_days_path)
        expect(flash[:notice]).to match("Holiday was successfully created.")
        expect(LeaveDay.last.holiday.to_s).to match("2022-07-03 00:00:00 UTC")
      end

    end
    
  end

end 