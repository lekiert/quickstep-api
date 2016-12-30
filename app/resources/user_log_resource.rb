class UserLogResource < JSONAPI::Resource
  attributes :user, :action_code, :additional_data, :created_at

  relationship :user, to: :one

  def additional_data
    @model.meta
  end

  def created_at
    @model.created_at.strftime("%H:%S, %d.%m.%Y ")
  end
end
