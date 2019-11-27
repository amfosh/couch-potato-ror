class CreateShows < ActiveRecord::Migration[6.0]
  def change
    create_table :shows do |t|
      t.string :show_title
      t.integer :user_id

      t.timestamps
    end
  end
end
