class CreateLeaveApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :leave_applications do |t|
      t.datetime :from_date
      t.datetime :to_date
      t.datetime :from_time
      t.datetime :to_time
      t.text :description
      t.integer :leave_type
      t.integer :status
      t.boolean :half_day, default: false
      t.references :user, null: false, foreign_key: true
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
