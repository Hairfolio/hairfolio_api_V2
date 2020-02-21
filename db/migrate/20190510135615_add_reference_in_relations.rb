class AddReferenceInRelations < ActiveRecord::Migration[5.2]
  def change
    #add_foreign_key :relations, :products
    add_foreign_key :categories_products, :products
  end
end
