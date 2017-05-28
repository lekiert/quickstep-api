class GroupResource < JSONAPI::Resource
  attributes :name, :description, :user_count

  relationship :users, to: :many
  relationship :teachers, to: :many
  relationship :courses, to: :many

  def user_count
    @model.users.count
  end

  def self.records(options = {})
    context = options[:context]
    user = context[:current_user]

    if !user.is_admin? && !user.is_supervisor? && !user.is_teacher?
      context[:current_user].groups
    else
      super
    end
  end
end
