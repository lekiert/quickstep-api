require_relative "../lib/lib/exceptions"

class TestResource < JSONAPI::Resource
  attributes :code, :name, :description, :last_score

  relationship :courses, to: :many
  relationship :exercises, to: :many
  relationship :answers, to: :many

  def self.records(options = {})
    context = options[:context]
    user = context[:current_user]

    if !user.is_admin? && !user.is_supervisor? && !user.is_teacher?
      ids = []
      tests = []
      groups = user.groups.includes(courses: :tests)

      for group in groups
        for course in group.courses
          for t in course.tests
            ids << t.id
          end
        end
      end

      Test.where(:id => ids)
    else
      super
    end
  end

  def last_score
    latest = @model.answers.where(user_id: context[:current_user].id).order(id: :desc).first

    latest.score
  rescue => e
    {}
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
