require 'rails_helper'

RSpec.describe 'UpdatesController', type: :request do
  before :each do
    sign_in(create(:user))
  end
  # before do
  #   create(:update)
  #   create(:project)
  #   create(:user)
  # end
  describe "update registration" do
    before do
      @params = {
        update: {
          description: "org1",
          in_time: Time.now, 
          out_time: Time.now + 2.hours
        }
      }
    end
    
    it "redirects to update index page" do
      post updates_path, params: @params, as: :turbo_stream
      expect(response).to be_successful
    end

    it 'creates a new contract' do
      record = create(:update)
      expect { post updates_path, params: @params, as: :turbo_stream }.to change(Update, :count).by(0)
    end


    it "check the description is right" do
      record = create(:update)
      get updates_path, params: {}, as: :turbo_stream
      expect(response.body).to include(record.description.to_s)
    end

    it "check the in_time is right" do
      record = create(:update)
      get updates_path, params: {}, as: :turbo_stream
      expect(response.body).to include(record.in_time.strftime('%d-%B-%Y'))
    end

    it "check the out_time is right" do
      record = create(:update)
      get updates_path, params: {}, as: :turbo_stream
      expect(response.body).to include(record.out_time.strftime('%d-%B-%Y'))
    end
  end

    it "for edit update form" do
      record = create(:update)
      get edit_update_path(record)
      expect(response.body).to include("Add Update")
    end
    
    describe "GET /Update" do
      before do
        params = {
          update: {
            description: "org1",
            in_time: Time.now, 
            out_time: Time.now + 2.hours
          },
        format: :turbo_stream
        }
       get updates_new_path
      end
    
      it "for new update form" do
        expect(response.body).to include("Add Update")
      end

      it "shows Start_time label" do
        expect(response.body).to include("Start_time")
      end
      
      it "shows End_time label" do
        expect(response.body).to include("End_time")
      end

      it "show project" do
        expect(response.body).to include("project")
      end

      it "show description" do
        expect(response.body).to include("description")
      end

      it "show the save button" do
        expect(response.body).to include("button")
      end
    end
    
  
  describe "POST /create" do
    
    it 'New Update' do
      get updates_new_path
    end
    
    it 'Create Update' do
      project = create(:project)
      post updates_path, params: { update: { description: 'ddddddd', in_time: Time.now, out_time: Time.now + 2.hours, project_id: project.id } }, as: :turbo_stream
      expect(response.body).to redirect_to(updates_path)
      expect(flash[:notice]).to match('Update was successfully created.')
      expect(Update.last.in_time.utc.to_i).to match(Time.now.to_i)
    end

  end

  describe "PATCH /update" do

    it 'Edit update ' do
      update = create(:update)
      get edit_update_path(update)
    end
  
    it 'update' do
      update = create(:update)
      put update_path(update), params: { update: { in_time: Time.now } }, as: :turbo_stream
      expect(response.body).to redirect_to(updates_path)
      expect(flash[:notice]).to match('Your Daily update was successfully updated.')
    end
  
  end


end
