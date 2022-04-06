class ProjectsController < ApplicationController
  before_action :find_user
  before_action :set_project, only: [:edit, :update, :destroy]

  # GET /projects or /projects.json
  def index
    @projects = Project.all
    @periods = Period.all
    #@projects = Project.where(:user_id => current_user)
    #@projects = current_user.projects
  end
  
  # GET /projects/1 or /projects/1.json
  def show
    @project = Project.find(params[:id])  
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])  
  end

  # POST /projects or /projects.json
  def create   
    @project = Project.new(project_params)
    # @project.user_id = params[:id].to_i
    respond_to do |format|
      if @project.save!
        format.html { redirect_to projects_url, notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    @project = Project.find(params[:id])
    # @projects = Project.where(:user_id => current_user) 
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to projects_url, notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_user
      @user = current_user
    end

    private 
    def set_project 
      @project = Project.find(params[:id]) 
    end 

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:name)
    end
end
