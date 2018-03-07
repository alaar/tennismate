class AddRadiusToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :radius, :string
  end
end
