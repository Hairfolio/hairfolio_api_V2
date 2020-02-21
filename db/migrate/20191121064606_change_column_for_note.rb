class ChangeColumnForNote < ActiveRecord::Migration[5.2]
  def change
    change_column :notes, :formula_note, :text, array: true, default: [], using: "(string_to_array(formula_note, ','))"
    change_column :notes, :simple_note, :text, array: true, default: [], using: "(string_to_array(simple_note, ','))"
  end
end
