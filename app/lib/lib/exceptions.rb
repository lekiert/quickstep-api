module Exceptions
  class AuthenticationError < StandardError; end
  class ValidationError < StandardError; end
  class NotAuthorizedError < StandardError; end
end
