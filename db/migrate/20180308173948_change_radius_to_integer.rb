class ChangeRadiusToInteger < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :radius, 'integer USING CAST(radius AS integer)'
  end
end
