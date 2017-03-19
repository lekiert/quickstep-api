class PasswordUpdatesController < ApplicationResourceController
  before_action :authenticate_user
  # before_action :only_related_user

  def create
    parameters = get_parameters
    if !current_user.is_admin?
      PasswordUpdate.update_user_password({
          :user_id => params[:user_id],
          :old_password => parameters[:'old-password'],
          :new_password => parameters[:'new-password']
      })
    else
      PasswordUpdate.update_user_password_without_auth({
          :user_id => params[:user_id],
          :new_password => parameters[:'new-password']
      })
    end

    render json: success_update
  rescue ::Exceptions::AuthenticationError
    render json: wrong_password, status: :conflict
  rescue ::Exceptions::ValidationError
    render json: validation_failed, status: :unprocessable_entity
  end

  def success_update
    password_change_result("OK")
  end

  def wrong_password
    password_change_result("WRONG_PASSWORD")
  end

  def validation_failed
    password_change_result("VALIDATION_FAILED")
  end

  def get_parameters
    params[:data][:attributes].permit(
      [:'user-id', :'old-password', :'new-password']
    ).to_h
  end

  def password_change_result(result)
    {
      :data => {
        :type => "password-update",
        :attributes => {
          :result => result
        }
      }
    }
  end
end
