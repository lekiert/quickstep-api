class UserLogResource < JSONAPI::Resource
  attributes :user_id, :user_name, :action_code, :additional_data, :created_at

  relationship :user, to: :one

  paginator :paged

  def self.records(options = {})
    context = options[:context]
    user = context[:current_user]
    if !user.is_admin? && !user.is_supervisor?
      context[:current_user].user_logs
    else
      super
    end
  end

  def user_name
    @model.user.first_name + ' ' + @model.user.last_name
  end

  def additional_data
    @model.meta
  end

  def created_at
    @model.created_at.strftime("%H:%S, %d.%m.%Y ")
  end
end
