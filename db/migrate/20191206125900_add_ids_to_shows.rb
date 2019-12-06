class AddIdsToShows < ActiveRecord::Migration[6.0]
  def change
    add_column :shows, :note_id, :integer
    add_column :shows, :status_id, :integer
  end
end
