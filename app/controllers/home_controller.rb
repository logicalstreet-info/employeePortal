class HomeController < ApplicationController
  def index
    @users = User.where(organization_id: current_user.organization_id)
    @admin = @users.with_role(:admin)
    p @admin  
    @bday = @users.where("(DATE_PART('month', birth_date) = ? AND DATE_PART('day', birth_date) >= ?) OR
                          (DATE_PART('month', birth_date) = ? AND DATE_PART('day', birth_date) <= ?)",
                          Date.current.month, Date.current.day, Date.current.month + 1, Date.current.day).order('birth_date ASC')
    @anniversary = @users.where("(DATE_PART('month', joining_date) = ? AND DATE_PART('day', joining_date) >= ?) OR
    (DATE_PART('month', joining_date) = ? AND DATE_PART('day', joining_date) <= ?)",
    Date.current.month, Date.current.day, Date.current.month + 1, Date.current.day).order('joining_date ASC')
    @leave_application = @users.joins(:leave_applications).where(leave_applications: { status: 'pending' })
    @leave_applications = LeaveApplication.joins(:user).where(
      users: { organization_id: current_user.organization_id }
    ).order('leave_applications.created_at DESC')
  end
end
