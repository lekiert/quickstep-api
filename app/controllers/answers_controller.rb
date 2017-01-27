class AnswersController < ApplicationResourceController

  def create
    if !current_user.is_admin?
      test_id = params[:data][:relationships][:test][:data].permit([:id]).to_h[:id]
      if Answer.where(test_id: test_id, user_id: current_user.id).count >= 2
        fail JSONAPI::Exceptions::SaveFailed.new()
      end
    end

    super
  rescue => e
    handle_exceptions(e)
    false
  end

end
