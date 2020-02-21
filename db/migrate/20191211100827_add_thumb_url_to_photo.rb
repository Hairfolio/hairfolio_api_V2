class AddThumbUrlToPhoto < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :thumb_url, :string
  end
end
