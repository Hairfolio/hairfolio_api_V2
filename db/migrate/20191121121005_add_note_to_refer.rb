class AddNoteToRefer < ActiveRecord::Migration[5.2]
  def change
    add_reference :refers, :note, foreign_key: true
  end
end
