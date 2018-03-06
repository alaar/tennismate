class AddSkillLevelToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :skill_level, :integer, :default => 1
  end
end
