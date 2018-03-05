class AddCourtToMatches < ActiveRecord::Migration[5.1]
  def change
    add_reference :matches, :court, foreign_key: true
  end
end
