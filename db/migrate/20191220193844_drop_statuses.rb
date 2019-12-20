class DropStatuses < ActiveRecord::Migration[6.0]
  def change
    drop_table :statuses
  end
end
