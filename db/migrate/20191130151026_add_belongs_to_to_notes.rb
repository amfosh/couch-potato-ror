class AddBelongsToToNotes < ActiveRecord::Migration[6.0]
  def change
    add_reference :notes, :show, foreign_key: true
  end
end
