class ExcerciseResource < JSONAPI::Resource
  attributes :code, :name, :command, :data, :status, :test_id, :excercise_type, :answers

  relationship :tests, to: :one

  # def data
  #     JSON.parse(@model.data)
  # end
end
