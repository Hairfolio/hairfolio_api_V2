class AddNewColumnInPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :is_trending, :boolean
    add_column :posts, :is_editors_pic, :boolean
  end
end
