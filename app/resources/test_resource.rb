class TestResource < JSONAPI::Resource
  attributes :code, :name, :description, :last_score

  relationship :courses, to: :many
  relationship :excercises, to: :many
  relationship :answers, to: :many

  def last_score
    latest = @model.answers.where(user_id: context[:current_user].id).order(id: :desc).first

    latest.score
  rescue => e
    {}
  end
end
