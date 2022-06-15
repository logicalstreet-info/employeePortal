require "rails_helper"

RSpec.describe 'LeaveApplicationsController', type: :request do

  before :each do
    sign_in(create(:user))
  end
  
  describe "leave application" do
    before do
      @params = {
        leave_application: {
          description: "Leave",
          from_date: Date.today,
          to_date: Date.today + 1,
          from_time: Time.now - 4.hours,
          to_time: Time.now - 3.hours,
          leave_type: Faker::Number.between(from: 0, to: 8),
          half_day: false,
          # user_id: user.id,
          # organization_id: organization.id 
        }
      }
    end
    
    it 'shows New leave Application Button' do
      get leave_applications_path
      expect(response.body).to include('New Leave Application')
    end

    describe "get index page" do
      it "check the description is right" do
        record = create(:leave_application)
        get leave_applications_path, params: {}, as: :turbo_stream
        expect(response.body).to include(record.description.to_plain_text)
      end

      it "check the from_date is right" do
        record = create(:leave_application)  
        get leave_applications_path, params: {}, as: :turbo_stream
        expect(response.body).to include(record.from_date.strftime('%d-%B-%Y'))
      end

      it "check the to_date is right format" do
        record = create(:leave_application)
        get leave_applications_path, params: {}, as: :turbo_stream
        expect(response.body).to include(record.to_date.strftime('%d-%B-%Y'))
      end

    end

    it "for a leave application" do
      get new_leave_application_path
      expect(response.body).to include("Leaves")
    end

    it "for a leave application from_date" do
      get new_leave_application_path
      expect(response.body).to include("From_Date")
    end

    it "for a leave application to_date" do
      get new_leave_application_path
      expect(response.body).to include("To_Date")
    end

    it "for a leave application leave_type" do
      get new_leave_application_path
      expect(response.body).to include("Leave_type")
    end

    it "for a leave application half_day" do
      get new_leave_application_path
      expect(response.body).to include("half_day")
    end

    it "for a leave application to_time" do
      get new_leave_application_path
      expect(response.body).to include("to_time")
    end

    it "for a leave application from_time" do
      get new_leave_application_path
      expect(response.body).to include("from_time")
    end

    it "for a leave application description" do
      get new_leave_application_path
      expect(response.body).to include("description")
    end

    
  end 

end

