class PasswordUpdateResource < JSONAPI::Resource
  relationship :users, to: :one
end
