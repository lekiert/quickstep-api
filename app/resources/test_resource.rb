class TestResource < JSONAPI::Resource
  attributes :code, :name, :description

  relationship :courses, to: :many
  relationship :excercises, to: :many
end
