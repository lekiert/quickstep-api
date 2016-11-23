class GroupResource < JSONAPI::Resource
  attributes :name, :description, :user_count

  relationship :users, to: :many

  def user_count
    @model.users.count
  end
end
