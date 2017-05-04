class CourseResource < JSONAPI::Resource
  attributes :name, :description

  relationship :users, to: :many
  relationship :tests, to: :many

  def self.records(options = {})
    context = options[:context]
    user = context[:current_user]

    if !user.is_admin? && !user.is_supervisor?
      context[:current_user].courses
    else
      super
    end
  end
end
