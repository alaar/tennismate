class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :punctuality
      t.integer :sportsmanship
      t.integer :accuracy

      t.timestamps
    end
  end
end
