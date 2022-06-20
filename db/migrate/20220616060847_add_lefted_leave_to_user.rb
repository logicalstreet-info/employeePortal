class AddLeftedLeaveToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :lefted_leave, :float, default: 0.0
  end
end
