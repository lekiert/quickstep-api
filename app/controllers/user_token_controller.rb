class UserTokenController < Knock::AuthTokenController
  def initialize(*args)
    super
    @logger = DBLogger.new
  end
  
  def create
    @logger.info(@entity.id, 'USER_HAS_LOGGED_IN', {})
    super
  end
end
