namespace :employee_portal do
  desc "a new task to be executed"
  task :count_leave, [:arg1, :arg2] => "environment" do |t, args|
    count = LeaveBalance.where("user_id = ? AND (DATE(leave_date) BETWEEN ? AND ?)",args[:arg1], Date.today.beginning_of_month, Date.today.end_of_month).count

    u = User.find(args[:arg1])
    total = count - 1.5 + u.lefted_leave
    if total < 0 
      u.lefted_leave = total
    else
      u.lefted_leave = 0
    end
    p u.lefted_leave
  end
end
