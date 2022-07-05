class AddFielsToLeaveDayAndUser < ActiveRecord::Migration[7.0]
  def change
    add_column :leave_days, :name, :string
    add_column :users, :skill, :string
    add_column :users, :employee_positions, :string
  end
end
