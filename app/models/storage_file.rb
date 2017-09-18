class StorageFile < ApplicationRecord
  has_attached_file :item
  validates_attachment :item, presence: true
  do_not_validate_attachment_file_type :item

  has_and_belongs_to_many :excercises
end
