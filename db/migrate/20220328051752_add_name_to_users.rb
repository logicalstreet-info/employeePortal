class AddNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :joining_date, :date
    add_column :users, :birth_date, :date
    add_column :users, :gender, :boolean
    add_column :users, :qualification, :string
    add_column :users, :mobile_number, :string
    add_column :users, :address, :text
    add_column :users, :native_address, :text
    add_column :users, :parent_name, :string
    add_column :users, :parent_mobile_number, :string
  end
end
