class UserResource < JSONAPI::Resource
  attributes :first_name, :last_name, :role, :email, :created_at, :password, :overall_score

  relationship :courses, to: :many
  relationship :password_updates, to: :many
  relationship :groups, to: :many
  relationship :answers, to: :many
  relationship :user_logs, to: :many

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
    super - [:password, :overall_score]
  end

  def overall_score
    if @model.overall_score == 0
      @model.set_overall_score
    end

    @model.overall_score
  end

  def self.records(options = {})
    context = options[:context]
    user = context[:current_user]

    if !user.is_admin? && !user.is_supervisor? && !user.is_teacher?
      User.where(:id => user.id)
    else
      super
    end
  end
end
