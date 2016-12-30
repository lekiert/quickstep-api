class UserTokenController < Knock::AuthTokenController
  def create
    DBLogger.info(@entity.id, 'USER_HAS_LOGGED_IN', {})
    super
  end
end
