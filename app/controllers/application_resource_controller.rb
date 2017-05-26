class ApplicationResourceController < JSONAPI::ResourceController
  include Knock::Authenticable

  before_action :authenticate_user

  rescue_from ::Exceptions::NotAuthorizedError, with: :reject_forbidden_request
  
  def reject_forbidden_request
    render json: {error: 'Forbidden'}, :status => 403
  end

  def context
    {current_user: current_user}
  end

  def only_related_user
    if !current_user.is_admin?
      render nothing: true, status: :unauthorized unless current_user.id.to_s == params[:id]
    end
  end
end
