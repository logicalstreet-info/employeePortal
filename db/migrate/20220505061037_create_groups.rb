class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :name
      t.boolean :is_private, default: false

      t.timestamps
    end
  end
end
