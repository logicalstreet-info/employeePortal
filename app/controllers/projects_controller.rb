class ProjectsController < ApplicationController
  before_action :find_user
  before_action :set_project, only: %i[edit update destroy]
  before_action :get_users, only: [:new, :create, :edit, :update]

  def index
    @projects = if has_role_admin?
                  Project.where(organization_id: current_user.organization_id)
                else
                  current_user.projects
                end
    @projects = @projects.page(params[:page]).per(5)
    @periods = Period.all
  end

  def show
    @project = Project.find(params[:id])
    @users = @project.users
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params.merge(organization_id: current_user.organization_id))
    if @project.save!
      redirect_to projects_url, notice: 'Project was successfully created.'
    else
      render :new, status: :unprocessable_entity 
    end 
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to projects_url, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  private

  def find_user
    @user = current_user
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :organization_id, user_ids: [])
  end

  def get_users
    @users_array = User.where(organization_id: current_user.organization_id).order(name: :asc).map { |c| [c.name, c.id] }
  end
end
