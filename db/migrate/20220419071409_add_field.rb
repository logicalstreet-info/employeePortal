class AddField < ActiveRecord::Migration[7.0]
  def change
    add_column :organizations, :weekly_off, :string, array: true
  end
end
