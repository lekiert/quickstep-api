class ApplicationResourceController < JSONAPI::ResourceController
  include Knock::Authenticable

  def only_related_user
    render nothing: true, status: :unauthorized unless current_user.id.to_s == params[:id]
  end
end
