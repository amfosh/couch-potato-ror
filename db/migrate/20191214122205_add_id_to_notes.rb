class AddIdToNotes < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :show_id, :integer
  end
end
