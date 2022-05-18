class ProjectsController < ApplicationController
  before_action :find_user
  before_action :set_project, only: %i[edit update destroy]

  # GET /projects or /projects.json
  def index
    @projects = Project.all
    @periods = Period.all
    # @projects = Project.where(:user_id => current_user)
    # @projects = current_user.projects
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params.merge(organization_id: current_user.organization_id))
    p @project.organization_id
    respond_to do |format|
      if @project.save!
        format.html { redirect_to projects_url, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @project = Project.find(params[:id])
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to projects_url, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def find_user
    @user = current_user
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :organization_id)
  end
end
