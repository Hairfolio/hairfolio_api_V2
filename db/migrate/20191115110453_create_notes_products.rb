class CreateNotesProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :notes_products , id: false, force: :cascade do |t|
      t.integer :product_id
      t.integer :note_id
    end
  end
end
