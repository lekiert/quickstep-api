class UserResource < JSONAPI::Resource
  attributes :first_name, :last_name, :role, :email

  relationship :courses, to: :many
  relationship :password_updates, to: :many
end
