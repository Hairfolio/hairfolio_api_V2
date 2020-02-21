class CreateActiveStorageAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :active_storage_attachments do |t|
      t.string :name, :null => false
      t.string :record_type, :null => false
      t.bigint :record_id, :null => false
      t.bigint :blob_id, :null => false
      t.timestamps
    end
    add_index :active_storage_attachments, [:record_type, :record_id, :name, :blob_id], unique: true, name: 'active_storage_unique_attachments'
    #add_foreign_key  :active_storage_blobs, :active_storage_attachments, column: :blob_id, name: 'active_storage_blob_fk_attachments'
  end
end