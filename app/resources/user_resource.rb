class UserResource < JSONAPI::Resource
  attributes :first_name, :last_name, :role, :email, :created_at, :password

  relationship :courses, to: :many
  relationship :password_updates, to: :many

  filters :first_name, :last_name, :role

  def created_at
    @model.created_at.strftime("%H:%S, %d.%m.%Y ")
  end

  def self.updatable_fields(context)
    super - [:password]
  end
end
