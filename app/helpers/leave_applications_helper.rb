module LeaveApplicationsHelper
  def pending_leave
    @leave_applications = LeaveApplication.joins(:user).where(
        users: { organization_id: current_user.organization_id }
      )
    @leave_applications = @leave_applications.where(status: "pending").count 
  end
end
