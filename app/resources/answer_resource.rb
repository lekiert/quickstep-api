class AnswerResource < JSONAPI::Resource
  
  paginator :paged

  attributes :answers, :created_at, :results, :score, :test_id, :test_name

  relationship :user, to: :one
  relationship :test, to: :one

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
    @model.score
  end

  def test_name
    @model.test.name
  end
end
