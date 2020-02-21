class RemoveUserIdFromNote < ActiveRecord::Migration[5.2]
  def change
    remove_column :notes, :user_id
    add_reference :notes, :contact, foreign_key: true
  end
end
