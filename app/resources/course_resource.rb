class CourseResource < JSONAPI::Resource
  attributes :name, :description

  relationship :users, to: :many
  relationship :tests, to: :many
end
