class AddColumnLabels < ActiveRecord::Migration[5.2]
  def change
    add_column :labels, :product_id, :integer
  end
end
