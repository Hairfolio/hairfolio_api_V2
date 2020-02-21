class CreateTableCategoriesProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :categories_products, id: false do |t|
      t.integer :category_id
      t.integer :product_id
    end
    #add_foreign_key  :categories, :categories_products, column: :blob_id
  end
end
