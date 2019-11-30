class AddBelongsToToStatus < ActiveRecord::Migration[6.0]
  def change
    add_reference :statuses, :show, foreign_key: true
  end
end
