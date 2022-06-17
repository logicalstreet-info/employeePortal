class LeaveBalance < ApplicationRecord
  belongs_to :user
  belongs_to :leave_application
  belongs_to :organization

  def self.count_month_leaves(beginning_month, end_month, user, organization)
    LeaveBalance.where("user_id = ? AND organization_id = ? AND (DATE(leave_date) BETWEEN ? AND ?)", user, organization, beginning_month, end_month).count
  end
end
