require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  def authenticated_header
    token = Knock::AuthToken.new(payload: { sub: users(:one).id }).token

    {
      'Accept': 'application/vnd.api+json',
      'Authorization': "Bearer #{token}"
    }
  end

  def unauthenticated_header
    {
      'Accept': 'application/vnd.api+json',
    }
  end

  test 'should respond success' do
    get '/groups', headers: authenticated_header

    assert_response :success
  end

  test 'should respond unauthorized' do
    get '/groups', headers: unauthenticated_header

    assert_response :unauthorized
  end
end
