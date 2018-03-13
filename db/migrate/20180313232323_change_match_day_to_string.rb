class ChangeMatchDayToString < ActiveRecord::Migration[5.1]
  def change
    change_column :matches, :day, 'varchar USING CAST(day AS date)'
  end
end
