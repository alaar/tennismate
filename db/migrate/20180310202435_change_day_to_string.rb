class ChangeDayToString < ActiveRecord::Migration[5.1]
  def change
    change_column :availabilities, :day, :string
  end
end
