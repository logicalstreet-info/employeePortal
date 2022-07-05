class CreateFeatureFlags < ActiveRecord::Migration[7.0]
  def change
    create_table :feature_flags do |t|
      t.string :employee_bond, default: 'off', null: false
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
