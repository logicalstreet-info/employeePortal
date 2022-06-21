class AddApporvedByToLeaveApplication < ActiveRecord::Migration[7.0]
  def change
    add_column :leave_applications, :apporved_by, :string
  end
end
