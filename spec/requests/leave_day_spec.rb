require 'rails_helper'

RSpec.describe "LeaveDaysController", type: :request do
  let(:user) { create(:user) }
  before :each do
    sign_in(user)
  end
  let(:valid_attributes) { { name: "Rakshabandhan",          
    holiday: Date.today + 3, organization_id: user.organization_id }}

  describe "leave_day" do
    
    it "should show leave_day" do
      get leave_days_path
      expect(response).to be_successful
    end
    
    it "for a leave_day holiday" do
      get new_leave_day_path, params: { leave_day: 
        valid_attributes}, as: :turbo_stream
      expect(response.body).to include("holiday")
    end

    describe "POST /create" do
     
      it 'New leave_day ' do
        get new_leave_day_path
      end
      
      it 'Create leave_day' do
        post leave_days_path, params: { leave_day: 
          valid_attributes}, as: :turbo_stream
        expect(response.body).to redirect_to(leave_days_path)
        expect(flash[:notice]).to match("Holiday was successfully created.")
        expect(LeaveDay.last.holiday).to match(Date.today + 3)
      end

      it 'invalid request' do
        post leave_days_path, params: { leave_day: 
          valid_attributes.merge!( name: nil, 
          holiday: nil, organization_id: user.organization_id ) }
        expect(response).to have_http_status(422)
      end

    end
    
  end

end 