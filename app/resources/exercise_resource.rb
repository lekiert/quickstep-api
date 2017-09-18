class ExerciseResource < JSONAPI::Resource
  attributes :code, :name, :command, :data, :status, :test_id, :exercise_type, :answers, :attachments, :point_factor

  relationship :tests, to: :one
  relationship :storage_files, to: :many

  def attachments
     @model.storage_files.map do |file|
      {
        id: file.id,
        url: file.item,
        type: file.item_content_type
      }
    end
  end
end
