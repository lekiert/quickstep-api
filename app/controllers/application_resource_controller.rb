class ApplicationResourceController < JSONAPI::ResourceController
  include Knock::Authenticable

  def only_related_user
    if !current_user.is_admin?
      render nothing: true, status: :unauthorized unless current_user.id.to_s == params[:id]
    end
  end
end
