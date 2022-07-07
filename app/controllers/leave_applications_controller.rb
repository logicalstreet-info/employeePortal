class LeaveApplicationsController < ApplicationController
  before_action :find_user
  before_action :get_users, only: %i[index]

  def index
    @leave_applications = if has_role_admin?
                            LeaveApplication.joins(:user).where(
                              users: { organization_id: current_user.organization_id }
                            ).order('leave_applications.from_date DESC')
                          else
                            LeaveApplication.where(user_id: current_user).order('from_date DESC')
                          end

    @leaves = if params[:user_id].present? && params[:status].present?
                @leave_applications.where(user_id: params[:user_id], status: params[:status])
              elsif params[:user_id].present?
                @leave_applications.where(user_id: params[:user_id])
              elsif params[:status].present?
                @leave_applications.where(status: params[:status])
              elsif params[:order].present?
                params[:order] == "ASC" ? @leave_applications.all.reorder('from_date ASC') : @leave_applications
              elsif params[:from_date].present? && params[:to_date].present?
                @leave_applications.where("((DATE(from_date) BETWEEN ? AND ?) AND (DATE(to_date) BETWEEN ? AND ?)) OR ((? BETWEEN DATE(from_date) AND DATE(to_date)) OR (? BETWEEN DATE(from_date) AND DATE(to_date)))", set_format(params[:from_date]), set_format(params[:to_date]), set_format(params[:from_date]), set_format(params[:to_date]), set_format(params[:from_date]), set_format(params[:to_date]))
              elsif params[:from_date].present?
                @leave_applications.where("? BETWEEN from_date AND to_date ", set_format(params[:from_date]))
              else 
                @leave_applications.all
              end
              
    @leaves = @leaves.page(params[:page]).per(5)
  end

  def new
    @leave_application = LeaveApplication.new
  end

  def create
    @leave_application = LeaveApplication.new(
      leave_params.merge(organization_id: current_user.organization_id, user_id: current_user.id)
    )
    respond_to do |format|
      if @leave_application.save
        format.html { redirect_to leave_applications_path, notice: 'Leave Application Created Sucessfully' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('leave_application_form',
          partial: 'leave_applications/form',
          locals: { leave_application: @leave_application })
        end
        format.html { render :new, status: :unprocessable_entity}
      end
    end
  end

  def edit
    @leave_application = LeaveApplication.find(params[:id])
  end

  def update
    @leave_application = LeaveApplication.find(params[:id])
    if current_user.id == @leave_application.user_id
      respond_to do |format|
        if @leave_application.update(leave_params)
          format.html { redirect_to leave_applications_path, notice: 'Your LeaveApplication Was Successfully Updated.' }
          format.json { render :show, status: :ok, location: @leave_application }
        else
          format.turbo_stream do
            render turbo_stream: turbo_stream.replace('leave_application_form', partial: 'leave_applications/form',
              locals: { leave_application: @leave_application })
          end
          format.html { render :edit, status: :unprocessable_entity}
        end
      end
    else
      redirect_to leave_applications_path
    end
  end

  def approve
    @leave_application = LeaveApplication.find(params[:id])
    @leave_application.status = 'approved'
    @leave_application.apporved_by = current_user.name
    if @leave_application.update(status: 'approved', apporved_by: current_user.name)
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
    @leave_application.apporved_by = current_user.name
    if @leave_application.update(status: 'rejected', apporved_by: current_user.name)
      if URI(request.referer).path == '/leave_applications'
        redirect_to leave_applications_path, notice: 'Leaves Reject Succsesfully'
      else
        redirect_to root_path, notice: 'Leaves Reject Succsesfully'
      end
    else
      redirect_to leave_applications_path, notice: 'Something went wrong'
    end
  end

  def get_calculated_leaves
    Organization.calculated_lefted_leaves_of_the_month(current_user.organization)
    redirect_to leave_applications_path
  end

  private

  def leave_params
    params.require(:leave_application).permit(:description, :from_time, :to_date, :from_date, :to_time, :half_day, :leave_type, :organization_id, :user_id)
  end

  def find_user
    @user = current_user
  end

  def set_format(date)
    dates = date.to_date
    dates.strftime('%Y-%m-%d')
  end

  def get_users
    @users_array = User.where(organization_id: current_user.organization_id).order(name: :asc).map { |c| [c.name, c.id] }
    @status = LeaveApplication.statuses.keys.collect { |s| [s.upcase, s] }
    @order = [ "ASC", "DESC" ]
  end
end
