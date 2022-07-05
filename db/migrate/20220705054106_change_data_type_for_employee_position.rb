class ChangeDataTypeForEmployeePosition < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :employee_positions, :integer, using: 'employee_positions::integer'
  end
end
