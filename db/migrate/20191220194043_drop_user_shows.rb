class DropUserShows < ActiveRecord::Migration[6.0]
  def change
    drop_table :user_shows
  end
end
