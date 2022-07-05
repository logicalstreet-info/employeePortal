class CreateBonds < ActiveRecord::Migration[7.0]
  def change
    create_table :bonds do |t|
      t.date :start_date
      t.date :end_date
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
