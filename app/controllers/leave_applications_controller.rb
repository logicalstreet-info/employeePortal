class LeaveApplicationsController < ApplicationController
  before_action :find_user

  def index
    if current_user.has_role? :admin
      @leave_applications = LeaveApplication.all.order("created_at DESC")
    else
      @leave_applications = LeaveApplication.where(:user_id => current_user).order("created_at DESC")
    end
  end

  def new
    @leave_application = LeaveApplication.new
  end

  def create
    @leave_application = LeaveApplication.create!(leave_params.merge(organization_id: current_user.organizations_id, user_id: current_user.id ))
    if @leave_application.save
      redirect_to
    else
      render :new
    end
  end

  def edit
    @leave_application = LeaveApplication.find(params[:id])
  end

  def update
    @leave_application = LeaveApplication.find(params[:id])
    if @leave_application.update(leave_params)
      redirect_to leave_applications_path, notice: "value updated"
    else
      render :edit
    end
  end

  def approve
    @leave_application = LeaveApplication.find(params[:id])
    @leave_application.status = "approved" 
    if @leave_application.update(status: "approved")
      redirect_to leave_applications_path, notice: "Leaves Approve Succsesfully"
    else
      redirect_to leave_applications_path, notice: "Something went wrong"
    end
  end

  def reject
    @leave_application = LeaveApplication.find(params[:id])
    @leave_application.status = "rejected" 
    if @leave_application.update(status: "rejected")
      redirect_to leave_applications_path, notice: "Leaves Reject Succsesfully"
    else
      redirect_to leave_applications_path, notice: "Something went wrong"
    end
  end


private
  def leave_params
    params.require(:leave_application).permit(:description, :from_time, :to_date, :from_date, :to_time, :half_day, :leave_type, :organization_id, :user_id)
  end
  def find_user
    @user = current_user
  end
end
