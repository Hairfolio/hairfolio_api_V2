class AddColumnInOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :order_number, :string
    add_column :orders, :payment_status, :integer
    add_column :orders, :shipping_status, :integer
    add_column :orders, :address_id, :integer
  end
end
