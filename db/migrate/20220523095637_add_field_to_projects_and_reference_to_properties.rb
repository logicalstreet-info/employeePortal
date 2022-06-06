class AddFieldToProjectsAndReferenceToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :project_end_date, :datetime
    add_reference :properties, :organization, index: true, foreign_key: true
  end
end
