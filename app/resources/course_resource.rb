class CourseResource < JSONAPI::Resource
  attributes :name, :description

  relationship :users, to: :many
  relationship :tests, to: :many

  def self.records(options = {})
    context = options[:context]
    user = context[:current_user]

    if !user.is_admin? && !user.is_supervisor?
      ids = user.groups.map { |g| g.id }
      courses_ids = CoursesGroup.where(group_id: ids).map { |cg| cg.course_id }

      puts '======================================'
      puts '======================================'
      puts '======================================'
      puts '======================================'
      puts '======================================'
      puts '======================================'
      puts '======================================'
      puts '======================================'

      Course.where(id: courses_ids)
    else
      super
    end
  end

  def self.updatable_fields(context)
    user = context[:current_user]

    if user && user.is_admin?
      super
    else
      []
    end
  end
end
