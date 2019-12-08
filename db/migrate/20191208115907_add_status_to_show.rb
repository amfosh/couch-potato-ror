class AddStatusToShow < ActiveRecord::Migration[6.0]
  def change
    add_column :shows, :status, :string
  end
end
