class PasswordUpdatesController < ApplicationResourceController
  before_action :authenticate_user
  # before_action :only_related_user

  def create
    parameters = get_parameters
    PasswordUpdate.update_user_password({
        :user_id => params[:user_id],
        :old_password => parameters[:'old-password'],
        :new_password => parameters[:'new-password']
    })

    render json: success_update
  rescue ::Exceptions::AuthenticationError
    render json: wrong_password, status: :conflict
  rescue ::Exceptions::ValidationError
    render json: validation_failed, status: :unprocessable_entity
  end

  def success_update
    {
      :data => {
        :type => "password-update",
        :attributes => {
          :result => "OK"
        }
      }
    }
  end

  def wrong_password
    {
      :data => {
        :type => "password-update",
        :attributes => {
          :result => "WRONG_PASSWORD"
        }
      }
    }
  end

  def validation_failed
    {
      :data => {
        :type => "password-update",
        :attributes => {
          :result => "VALIDATION_FAILED"
        }
      }
    }
  end

  def get_parameters
    params[:data][:attributes].permit(
      [:'user-id', :'old-password', :'new-password']
    ).to_h
  end
end
