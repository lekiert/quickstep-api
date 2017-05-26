require_relative "../lib/lib/logger/base_logger"
require_relative "../lib/lib/logger/db_logger"

class UsersController < ApplicationResourceController
  # before_action :only_related_user

  def create(*args)
    result = super(*args)
    DBLogger.info(current_user.id, 'USER_HAS_BEEN_CREATED', {
      first_name: current_user.first_name,
      last_name: current_user.last_name
    })
    result
  end

  def update(*args)
    user = User.find(params[:id])
    result = super(*args)
    DBLogger.info(current_user.id, 'USER_HAS_BEEN_UPDATED', {
      admin: {
        id: current_user.id,
        first_name: current_user.first_name,
        last_name: current_user.last_name
      },
      target: { id: user.id, :first_name => user.first_name, :last_name => user.last_name }
    })
    result
  end

  def delete(*args)
    user = User.find(params[:id])
    result = super(*args)
    DBLogger.info(current_user.id, 'USER_HAS_BEEN_DELETED', {
      first_name: current_user.first_name,
      last_name: current_user.last_name
    }, { :first_name => user.first_name, :last_name => user.last_name })
    result
  end
end
