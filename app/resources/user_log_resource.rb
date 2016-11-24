class UserLogResource < JSONAPI::Resource
  attributes :user_id, :action_code, :additional_data

  def additional_data
    @model.meta
  end

  relationship :users, to: :one
end
