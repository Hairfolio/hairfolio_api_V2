class CreateCartUniqueCodes < ActiveRecord::Migration[5.2]
  def change
  	create_table :carts do |t|
    	t.timestamps
    	t.integer :user_id
    	t.integer :product_id
    	t.integer :quantity      
    end

    create_table :cart_unique_codes do |t|
      t.references :cart, foreign_key: true
      t.string :unique_code
      t.timestamps
    end
  end
end
