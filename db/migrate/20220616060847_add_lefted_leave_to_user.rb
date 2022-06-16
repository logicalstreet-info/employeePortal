class AddLeftedLeaveToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :lefted_leave, :float, default: 0.0
    add_column :organizations, :given_leave_to_employee, :float
  end
end
