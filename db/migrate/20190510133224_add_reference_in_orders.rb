class AddReferenceInOrders < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :orders, :addresses
  end
end
