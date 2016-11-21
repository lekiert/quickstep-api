require 'test_helper'

class PasswordUpdatesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(first_name: "Adam",
                     last_name: "Kowalski",
                     email: "adam@kowalski.com",
                     password: "secret",
                     password_confirmation: "secret",
                     role: "USER",
                     status: 1)
  end

  def authenticated_header
    token = Knock::AuthToken.new(payload: { sub: @user.id }).token

    {
      'Content-Type': 'application/vnd.api+json',
      'Accept': 'application/vnd.api+json',
      'Authorization': "Bearer #{token}"
    }
  end

  def unauthenticated_header
    {
      'Content-Type': 'application/vnd.api+json'
    }
  end

  test 'should change password' do
    payload = {
      :data => {
        :type => 'password-updates',
        :attributes => {
          :'old-password' => 'secret',
          :'new-password' => 'secret1'
        }
      }
    }

    post '/users/' + @user.id.to_s + '/password-updates',
         headers: authenticated_header,
         params: payload.to_json

    assert_response :success
  end

end
