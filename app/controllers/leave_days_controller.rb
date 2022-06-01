class LeaveDaysController < ApplicationController
  before_action :find_user

  def index
    @leave_days = LeaveDay.where(organization_id: current_user.organization_id).order('created_at DESC').page(params[:page]).per(5)
  end

  def new
    @leave_day = LeaveDay.new
  end

  def create
    @leave_day = LeaveDay.create!(leave_params.merge(organization_id: current_user.organization_id))
    if @leave_day.save
      redirect_to
    else
      render :new
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
