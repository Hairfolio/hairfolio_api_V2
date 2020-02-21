class CreateProductGalleries < ActiveRecord::Migration[5.2]
  def change
    create_table :product_galleries do |t|
    	#t.integer :product_id
    	t.references :product, foreign_key: true
      	t.string :image_url
      	t.timestamps
    end
  end
end
