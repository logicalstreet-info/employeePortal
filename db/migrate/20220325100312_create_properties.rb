class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.text :description
      t.date :purchase_date
      t.integer :warranty_month
      t.integer :assets_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
