class ExcerciseResource < JSONAPI::Resource
  attributes :code, :name, :command

  relationship :tests, to: :one
end
