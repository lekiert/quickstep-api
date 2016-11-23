class UserResource < JSONAPI::Resource
  attributes :first_name, :last_name, :role, :email, :created_at, :password

  relationship :courses, to: :many
  relationship :password_updates, to: :many
  relationship :groups, to: :many

  filter :search, apply: ->(records, value, _options) {
    query = value[0]
    records.where("
                    users.email LIKE '%#{query}%' OR
                    users.first_name LIKE '%#{query}%' OR
                    users.last_name LIKE '%#{query}%'
                  ")
  }

  filters :last_name, :first_name, :email, :role


  def created_at
    @model.created_at.strftime("%H:%S, %d.%m.%Y ")
  end

  def self.updatable_fields(context)
    super - [:password]
  end
end
