class PasswordUpdate
  include ActiveModel::Model

  def self.update_user_password(params)
    user_id = params[:user_id]
    password = params[:old_password]
    new_password = params[:new_password]
    user = User.find(user_id)

    if (user.authenticate(password))
      user.password = new_password

      if !user.valid?
        fail ::Exceptions::ValidationError
      end

      user.save
      true
    else
      fail ::Exceptions::AuthenticationError
    end
  end

  def self.update_user_password_without_auth(params)
    user_id = params[:user_id]
    new_password = params[:new_password]
    user = User.find(user_id)
    puts params
    user.password = new_password

    if !user.valid?
      fail ::Exceptions::ValidationError
    end

    user.save
    true
  end

  def self.success_update
    {
      :data => {
        :type => "password-update",
        :attributes => {
          :result => "OK"
        }
      }
    }
  end

  def self.wrong_password
    {
      :data => {
        :type => "password-update",
        :attributes => {
          :result => "WRONG_PASSWORD"
        }
      }
    }
  end

  def self.validation_failed
    {
      :data => {
        :type => "password-update",
        :attributes => {
          :result => "VALIDATION_FAILED"
        }
      }
    }
  end
end
