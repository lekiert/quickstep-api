require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
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
    get '/courses', headers: authenticated_header

    assert_response :success
  end

  test 'should respond unauthorized' do
    get '/courses', headers: unauthenticated_header

    assert_response :unauthorized
  end

  test 'should return assigned courses' do
    course = courses(:one)
    get '/users/' + course.id.to_s + '/courses', headers: authenticated_header

    assert_response :success
  end

  test 'should not return unassigned course' do
    course = courses(:two)
    get '/courses/' + course.id.to_s, headers: authenticated_header

    assert_response :not_found
  end
end
