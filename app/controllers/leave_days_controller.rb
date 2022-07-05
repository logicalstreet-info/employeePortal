class LeaveDaysController < ApplicationController
  before_action :find_user

  def index
    @leave_days = LeaveDay.where(organization_id: current_user.organization_id).order('created_at DESC').page(params[:page]).per(5)
  end

  def new
    @leave_day = LeaveDay.new
  end

  def create
    @leave_day = LeaveDay.create(leave_params.merge(organization_id: current_user.organization_id))
    respond_to do |format|
      if @leave_day.save
        format.html { redirect_to leave_days_path, notice: 'Holiday was successfully created.' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('leave_day_form',
          partial: 'leave_days/form',
          locals: { leave_day: @leave_day })
        end
        format.html { render :new, status: :unprocessable_entity}
      end
    end
  end

  private

  def leave_params
    params.require(:leave_day).permit(:holiday, :organization_id)
  end

  def find_user
    @user = current_user
  end
end
