class DBLogger < BaseLogger
  def self.info(user_id, code, meta)
    UserLog.create(
      user_id: user_id,
      action_code: code,
      meta: meta
    )
  end

  def info(*args)
    self.info(args)
  end

  def self.warning
    UserLog.create(
      user_id: user_id,
      action_code: code,
      meta: meta
    )
  end

  def self.error
    UserLog.create(
      user_id: user_id,
      action_code: code,
      meta: meta
    )
  end
end
