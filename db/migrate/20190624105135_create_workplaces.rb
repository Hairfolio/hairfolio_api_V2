class CreateWorkplaces < ActiveRecord::Migration[5.2]
  def change
    create_table :workplaces do |t|
      t.references :salon, foreign_key: true
      t.string :name
      t.text  :info
      t.text :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :website
      t.string :phone

      t.timestamps
    end
  end
end
