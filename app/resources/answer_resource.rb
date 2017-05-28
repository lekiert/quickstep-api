class AnswerResource < JSONAPI::Resource

  paginator :paged

  attributes :answers, :created_at, :results, :score, :test_id, :test_name

  relationship :user, to: :one
  relationship :test, to: :one

  def self.records(options = {})
    context = options[:context]
    user = context[:current_user]
    puts user
    if user.is_teacher?
      teacher = Teacher.find(user.id)
      groups = teacher.groups.includes(users: :answers)
      ids = []
      
      for group in groups
        for _user in group.users
          for t in _user.answers
            ids << t.id
          end
        end
      end

      Answer.where(:id => ids)

    elsif !user.is_admin? && !user.is_supervisor?
      context[:current_user].answers
    else
      super
    end
  end


  def created_at
    @model.created_at.strftime("%H:%S, %d.%m.%Y ")
  end

  def test_id
    @model.test_id
  end

  def results
    @model.results
  end

  def score
    if !@model.score.is_a?(Hash)
      @model.set_score
    end

    @model.score
  end

  def test_name
    @model.test.name
  end
end
