class CreateLeaveBalances < ActiveRecord::Migration[7.0]
  def change
    create_table :leave_balances do |t|
      t.datetime :leave_date
      t.references :user, null: false, foreign_key: true
      t.references :leave_application, null: false, foreign_key: true
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
