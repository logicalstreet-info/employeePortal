class LeaveBalance < ApplicationRecord
  belongs_to :user
  belongs_to :leave_application
  belongs_to :organization

  def self.count_month_leaves(beginning_month, end_month)
    LeaveBalance.where("(DATE(leave_date) BETWEEN ? AND ?)", beginning_month, end_month).count
  end
end
