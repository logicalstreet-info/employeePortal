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
          to_date: Date.today,
          from_time: Time.now - 4.hours,
          to_time: Time.now - 3.hours,
          leave_type: :Personal,
          half_day: true
        }
      }
    end
    
    it "should show leave_day" do
      get leave_applications_path
      expect(response).to be_successful
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
        expect(response.body).to include(record.from_date.strftime('%d-%m-%Y'))
      end
      
      it "check the to_date is right" do
        record = create(:leave_application)
        get leave_applications_path, params: {}, as: :turbo_stream
        expect(response.body).to include(record.to_date.strftime('%d-%m-%Y'))
      end

    end

    it "for a leave application" do
      get new_leave_application_path
      expect(response.body).to include("New LeaveApplication")
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

    describe "POST /create" do
     
      it 'New LeaveApplication ' do
        get new_leave_application_path
      end
      
      it 'Create LeaveApplication' do
        post leave_applications_path, params: @params
        expect(response.body).to redirect_to(leave_applications_path)
        expect(flash[:notice]).to match("Leave Application Created Sucessfully")
        expect(LeaveApplication.last.leave_type).to match("Personal")
      end
    end 
    
    describe "PATCH /LeaveApplication" do

      it 'Edit LeaveApplication' do
        leave = create(:leave_application)
        get edit_leave_application_path(leave)
      end
    
      it 'Update LeaveApplication' do
        leave = create(:leave_application)
        put leave_application_path(leave), params: { leave_application: { leave_type: :Medical } }, as: :turbo_stream
        expect(response.body).to redirect_to(leave_applications_path)
        expect(flash[:notice]).to match('Your LeaveApplication Was Successfully Updated.')
      end
    
    end

    describe "POST /LeaveApplication/approve" do

      it 'request referer and status is right' do
        leave_application = create(:leave_application)
        patch approve_leave_application_path(leave_application),params: { leave_application: { status: :approved } }, headers: { 'HTTP_REFERER' => '/leave_applications' }, as: :turbo_stream
        expect(response.body).to redirect_to(leave_applications_path)
        expect(flash[:notice]).to match('Leaves Approve Succsesfully')
      end

      it 'request referer and status is not right' do
        leave_application = create(:leave_application)
        patch approve_leave_application_path(leave_application),params: { leave_application: { status: :approved } }, headers: { 'HTTP_REFERER' => '' }, as: :turbo_stream
        expect(response.body).to redirect_to(root_path)
        expect(flash[:notice]).to match('Leaves Approve Succsesfully')
      end
    
    end

    describe "PATCH /LeaveApplication/rejected" do

      it 'request referer and status is right' do
        leave_application = create(:leave_application)
        patch reject_leave_application_path(leave_application),params: { leave_application: { status: :rejected } }, headers: { 'HTTP_REFERER' => '/leave_applications' }, as: :turbo_stream
        expect(response.body).to redirect_to(leave_applications_path)
        expect(flash[:notice]).to match('Leaves Reject Succsesfull')
      end

      it 'request referer and status is not right' do
        leave_application = create(:leave_application)
        patch reject_leave_application_path(leave_application),params: { leave_application: { status: :rejected } }, headers: { 'HTTP_REFERER' => '' }, as: :turbo_stream
        expect(response.body).to redirect_to(root_path)
        expect(flash[:notice]).to match('Leaves Reject Succsesfully')
      end
    
    end
    
  end 

end