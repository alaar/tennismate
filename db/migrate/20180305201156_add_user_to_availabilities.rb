class AddUserToAvailabilities < ActiveRecord::Migration[5.1]
  def change
    add_reference :availabilities, :user, foreign_key: true
  end
end
