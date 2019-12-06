class ChangeWatchedToStringInStatuses < ActiveRecord::Migration[6.0]
  def change
    change_column :statuses, :watched, :string
  end
end
