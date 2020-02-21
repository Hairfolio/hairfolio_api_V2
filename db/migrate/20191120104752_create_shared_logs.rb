class CreateSharedLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :shared_logs do |t|
      t.string :title, default: "Recommanded by"
      t.string :description, default: "Take a look at some nice products"
      t.references :note, foreign_key: true

      t.timestamps
    end
  end
end
