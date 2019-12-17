class RemoveIdFromNotes < ActiveRecord::Migration[6.0]
  def change

    remove_column :notes, :show_id, :integer
  end
end
