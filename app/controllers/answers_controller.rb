class AnswersController < ApplicationResourceController
  before_action :authenticate_user

  # def create(*args)
  #   # if !current_user.is_admin?
  #   #   test_id = params[:data][:relationships][:test][:data].permit([:id]).to_h[:id]
  #   #   if Answer.where(test_id: test_id, user_id: current_user.id).count >= 2
  #   #     fail JSONAPI::Exceptions::SaveFailed.new()
  #   #   end
  #   # end
  #
  #   result = super(*args)
  #   DBLogger.info(current_user.id, 'USER_HAS_SUBMITTED_ANSWER', {
  #     user_id: current_user.id,
  #     test_id: test_id
  #   })
  #   result
  # rescue => e
  #   handle_exceptions(e)
  #   false
  # end

end