class LeaveApplicationsController < ApplicationController
  before_action :find_user
  before_action :get_users, only: %i[index]

  def index
    q = []
    s = []
    @leave_applications = if current_user.has_role? :admin
                            LeaveApplication.joins(:user).where(
                              users: { organization_id: current_user.organization_id }
                            ).order('leave_applications.created_at DESC')
                          else
                            LeaveApplication.where(user_id: current_user).order('created_at DESC')
                          end

    @leaves = if params[:user_id].present? && params[:status].present?
                @leave_applications.where(user_id: params[:user_id], status: params[:status])
              elsif params[:user_id].present?
                @leave_applications.where(user_id: params[:user_id])
              elsif params[:status].present?
                @leave_applications.where(status: params[:status])
              elsif params[:from_date].present?
                q << "from_date <= ? AND to_date >= ?"
                s << params[:from_date]
                s << params[:from_date]
                @leave_applications.where(q.join(' AND '), *s)
              else 
                @leave_applications.all
              end
  end

  def new
    @leave_application = LeaveApplication.new
  end

  def create
    @leave_application = LeaveApplication.create!(
      leave_params.merge(organization_id: current_user.organization_id, user_id: current_user.id)
    )
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
      redirect_to leave_applications_path, notice: 'value updated'
    else
      render :edit
    end
  end

  def approve
    @leave_application = LeaveApplication.find(params[:id])
    @leave_application.status = 'approved'
    if @leave_application.update(status: 'approved')
      if URI(request.referer).path == '/leave_applications'
        redirect_to leave_applications_path, notice: 'Leaves Approve Succsesfully'
      else
        redirect_to root_path, notice: 'Leaves Approve Succsesfully'
      end
    else
      redirect_to leave_applications_path, notice: 'Something went wrong'
    end
  end

  def reject
    @leave_application = LeaveApplication.find(params[:id])
    @leave_application.status = 'rejected'
    if @leave_application.update(status: 'rejected')
      if URI(request.referer).path == '/leave_applications'
        redirect_to leave_applications_path, notice: 'Leaves Reject Succsesfully'
      else
        redirect_to root_path, notice: 'Leaves Reject Succsesfully'
      end
    else
      redirect_to leave_applications_path, notice: 'Something went wrong'
    end
  end

  private

  def leave_params
    params.require(:leave_application).permit(:description, :from_time, :to_date, :from_date, :to_time, :half_day, :leave_type, :organization_id, :user_id)
  end

  def find_user
    @user = current_user
  end

  def get_users
    @users_array = User.where(organization_id: current_user.organization_id).order(name: :asc).map { |c| [c.name, c.id] }
    @status = LeaveApplication.statuses.keys.collect { |s| [s.upcase, s] }
  end
end
