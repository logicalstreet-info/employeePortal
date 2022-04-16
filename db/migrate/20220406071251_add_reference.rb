class AddReference < ActiveRecord::Migration[7.0]
  def change
    add_reference :projects, :organization, index: true, foreign_key: true
    add_reference :users, :organization, index: true, foreign_key: true
  end
end