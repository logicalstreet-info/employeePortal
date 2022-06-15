require 'rails_helper'

RSpec.describe "ProjectsController", type: :request do
  let(:user) { create(:user) }
  before :each do
    sign_in(user)
  end

  describe "project" do
    
    before do 
      @params = { 
        project: { 
          name: 'My project', 
          organization_id: user.organization_id 
        }, 
        user_ids: [user.id] 
      }
    end

    it "should show project" do
      user = create(:user)
      get projects_path(user), params: @params, as: :turbo_stream
      expect(response).to be_successful
    end
    
    it "for a project name" do
      user =  create(:user)
      get new_project_path(user), params: @params, as: :turbo_stream
      expect(response.body).to include("name")
    end

    describe "POST /create" do
     
      it 'New project ' do
        user = create(:user)
        get new_project_path(user)
      end
      
      it 'Create project' do
        user = create(:user)
        post projects_path(user), params: @params, as: :turbo_stream
        expect(response.body).to redirect_to(projects_path)
        expect(flash[:notice]).to match('Project was successfully created.')
        expect(Project.last.name).to match('My project')
      end

    end

    describe "PATCH /project" do

      it 'Edit project' do
        user = create(:user)
        project = create(:project)
        get edit_project_path(user, project)
      end
    
      it 'Update project' do
        user = create(:user)
        project = create(:project)
        put project_path(user, project), params: { project: { name: 'My new project' } }, as: :turbo_stream
        expect(response.body).to redirect_to(projects_path)
        expect(flash[:notice]).to match('Project was successfully updated.')
      end
    
    end

    describe "DELETE /destroy" do
     
      it "delete project" do
        project = create(:project)
        delete project_path(project)
        expect(response.body).to redirect_to(projects_path)
        expect(flash[:notice]).to match('Project was successfully destroyed.')
      end
    end
  
  end

end 