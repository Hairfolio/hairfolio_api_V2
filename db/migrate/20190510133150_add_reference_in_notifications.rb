class AddReferenceInNotifications < ActiveRecord::Migration[5.2]
  def change
    #add_reference :notifications, :like, index: true
    add_foreign_key :notifications, :likes
    #add_reference :notifications, :favourite, index: true
    add_foreign_key :notifications, :favourites
  end
end
