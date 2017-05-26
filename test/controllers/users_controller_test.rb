require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def authenticated_header
    token = Knock::AuthToken.new(payload: { sub: users(:one).id }).token

    {
      'Accept': 'application/vnd.api+json',
      'Content-Type': 'application/vnd.api+json',
      'Authorization': "Bearer #{token}"
    }
  end

  def authenticated_header_admin
    token = Knock::AuthToken.new(payload: { sub: users(:admin).id }).token

    {
      'Accept': 'application/vnd.api+json',
      'Content-Type': 'application/vnd.api+json',
      'Authorization': "Bearer #{token}"
    }
  end

  def unauthenticated_header
    {
      'Accept': 'application/vnd.api+json',
    }
  end

  test 'should respond success and display' do

    get '/users', headers: authenticated_header

    assert_response :success
  end

  test 'should find only student himself if the user is a student' do
    user1 = users(:one)
    user2 = users(:two)

    get '/users', headers: authenticated_header

    assert response.body.include?(user1.email)
    assert !response.body.include?(user2.email)
  end

  test 'should not find user other than student himself' do
    user = users(:two)

    get '/users/' + user.id.to_s, headers: authenticated_header

    assert_response :not_found
  end

  test 'should display other users to admin' do
    user = users(:two)

    get '/users/' + user.id.to_s, headers: authenticated_header_admin

    assert_response :success
  end

  test 'should not be able to update other users' do
    user = users(:two)
    post_data = {
      data: {
        id: user.id.to_s,
        type: "users",
        attributes: {
          'first-name': "John2",
          'last-name': "Doe",
          email: "john@doe.com",
          role: "STUDENT"
        }
      }
    }

    patch '/users/' + user.id.to_s, params: post_data.to_json(), headers: authenticated_header

    assert_response :not_found
  end
end
