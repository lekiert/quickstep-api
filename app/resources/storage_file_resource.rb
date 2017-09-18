class StorageFileResource < JSONAPI::Resource
  attributes :name, :description, :item, :mime

  relationship :exercises, to: :many

  def mime
    @model.item.instance.item_content_type
  end
end
