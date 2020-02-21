class AddColumnFolios < ActiveRecord::Migration[5.2]
  def change
    add_column :folios, :total_posts, :integer
  end
end
