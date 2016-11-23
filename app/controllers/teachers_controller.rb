class TeachersController < ApplicationResourceController
  before_action :authenticate_user
  before_action :only_related_user
end
