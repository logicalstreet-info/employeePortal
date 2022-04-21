class CreateLeaveDays < ActiveRecord::Migration[7.0]
  def change
    create_table :leave_days do |t|
      t.datetime :holiday
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
