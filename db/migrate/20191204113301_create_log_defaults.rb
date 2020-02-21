class CreateLogDefaults < ActiveRecord::Migration[5.2]
  def change
    create_table :log_defaults do |t|
      t.string :title
      t.string :description
      t.timestamps
    end
  end
end
