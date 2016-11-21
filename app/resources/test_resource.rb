class TestResource < JSONAPI::Resource
  attributes :code, :name, :description

  relationship :courses, to: :many
end
