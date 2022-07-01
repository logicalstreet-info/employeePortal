class AddTotalHoursToUpdate < ActiveRecord::Migration[7.0]
  def change
    add_column :updates, :total_hours, :integer
  end
end
