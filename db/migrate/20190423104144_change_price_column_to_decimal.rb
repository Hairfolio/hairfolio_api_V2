class ChangePriceColumnToDecimal < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :price, :decimal, :precision => 15, :scale => 6, null: false
    add_column :products, :quantity, :integer
    add_column :products, :favourites_count, :integer
    add_column :products, :product_image, :string
    add_column :products, :product_brand_id, :integer
    add_column :products, :is_trending,:boolean
    add_column :products, :short_description,:text
    add_column :products, :description,:text
    #change_column :products, :price, :decimal, :precision => 15, :scale => 6, null: false
  end
end
