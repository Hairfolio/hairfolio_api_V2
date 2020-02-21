class AddReferenceInPostsProduct < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :posts_products, :products
    add_foreign_key :posts_products, :posts
  end
end
