class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.integer :approver_id, foreign_key: true
      t.integer :requester_id, foreign_key: true
      # t.references :court, foreign_key: true
      t.string :status
      t.date :day
      t.string :time

      t.timestamps
    end
  end
end
