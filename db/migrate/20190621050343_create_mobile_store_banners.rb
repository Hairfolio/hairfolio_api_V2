class CreateMobileStoreBanners < ActiveRecord::Migration[5.2]
  def change
    create_table :mobile_store_banners do |t|
      t.string :name
      t.string :banner_image
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
