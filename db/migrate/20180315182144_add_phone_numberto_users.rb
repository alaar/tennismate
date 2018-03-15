class AddPhoneNumbertoUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :phone, :string, :default => "000-000-0000"
  end
end
