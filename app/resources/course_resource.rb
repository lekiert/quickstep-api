class CourseResource < JSONAPI::Resource
  attributes :name, :description, :level

  relationship :users, to: :many
  relationship :tests, to: :many

  def level
    @model.level.name
  end
end
