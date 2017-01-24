class AddAttachmentItemToStoragefiles < ActiveRecord::Migration
  def self.up
    change_table :storage_files do |t|
      t.attachment :item
    end
  end

  def self.down
    remove_attachment :storage_files, :item
  end
end
