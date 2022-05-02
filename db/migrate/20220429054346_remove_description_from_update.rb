class RemoveDescriptionFromUpdate < ActiveRecord::Migration[7.0]
  def change
    remove_column :updates, :description, :text
    remove_column :leave_applications, :description, :text
    remove_column :properties, :description, :text
  end
end
