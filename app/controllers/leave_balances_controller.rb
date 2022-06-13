class LeaveBalancesController < ApplicationController
  def index
    @leave_balance = LeaveBalance.where("(DATE(leave_date) BETWEEN ? AND ?)", Date.today.beginning_of_month, Date.today.end_of_month).count
  end
end