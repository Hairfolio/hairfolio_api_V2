class AddNewColumeInCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :image, :string, :limit => 1000
  end
end
