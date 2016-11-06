class ApplicationResourceController < JSONAPI::ResourceController
  include Knock::Authenticable
end
