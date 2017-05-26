# config/initializer/jsonapi-resources.rb
require_relative "../../app/lib/lib/exceptions"
JSONAPI.configure do |config|
  config.exception_class_whitelist = [::Exceptions::NotAuthorizedError]
end
