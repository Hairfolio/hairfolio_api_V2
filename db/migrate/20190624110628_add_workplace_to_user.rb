class AddWorkplaceToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :workplace, foreign_key: true
  end
end
