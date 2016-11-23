class GroupResource < JSONAPI::Resource
  attributes :name, :description, :user_count

  relationship :users, to: :many
  relationship :teachers, to: :many

  def user_count
    @model.users.count
  end
end
