class CreatePostsProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts_products, id: false, force: :cascade do |t|
      t.integer :product_id
      t.integer :post_id
    end
  end
end
