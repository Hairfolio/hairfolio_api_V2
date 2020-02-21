class AddColumnInNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :like_id, :integer
    add_column :notifications, :favourite_id, :integer
  end
end
