class RemoveColumnsFromShows < ActiveRecord::Migration[6.0]
  def change

    remove_column :shows, :user_id, :integer

    remove_column :shows, :note_id, :integer

    remove_column :shows, :status_id, :integer

    remove_column :shows, :status, :string
  end
end
