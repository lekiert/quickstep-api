class ExcerciseResource < JSONAPI::Resource
  attributes :code, :name, :command, :data, :status, :test_id, :excercise_type, :answers, :attachments

  relationship :tests, to: :one
  relationship :storage_files, to: :many

  def attachments
     @model.storage_files.map do |file|
      {
        url: file.item,
        type: file.item_content_type
      }
    end
  end
end
