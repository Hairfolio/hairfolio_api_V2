class AddTotalPostsToFolio < ActiveRecord::Migration[5.2]
  def change
    add_column :folios, :total_posts, :integer, default: 0
  end
end
