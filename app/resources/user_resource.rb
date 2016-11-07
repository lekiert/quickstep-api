class UserResource < JSONAPI::Resource
  attributes :first_name, :last_name, :role

  relationship :courses, to: :many
end
