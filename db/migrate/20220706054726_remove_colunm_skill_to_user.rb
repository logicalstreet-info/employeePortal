class RemoveColunmSkillToUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :skill
  end
end
