module LeaveApplicationHelper

  def self.leave_application_params
    {
      description: "Leave",
      from_date: Date.today,
      to_date: Date.today,
      from_time: Time.now - 4.hours,
      to_time: Time.now - 3.hours,
      leave_type: :Personal,
      half_day: true
    }
  end
end