class StorageFileResource < JSONAPI::Resource
  attributes :name, :description, :item

  relationship :excercises, to: :many
end
