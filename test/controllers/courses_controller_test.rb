require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  def authenticated_header_student
    token = Knock::AuthToken.new(payload: { sub: users(:one).id }).token

    {
      'Accept': 'application/vnd.api+json',
      'Authorization': "Bearer #{token}",
      'Content-Type': 'application/vnd.api+json'
    }
  end

  def authenticated_header_admin
    token = Knock::AuthToken.new(payload: { sub: users(:admin).id }).token

    {
      'Accept': 'application/vnd.api+json',
      'Authorization': "Bearer #{token}",
      'Content-Type': 'application/vnd.api+json'
    }
  end

  def unauthenticated_header
    {
      'Accept': 'application/vnd.api+json',
    }
  end

  test 'should respond success for student' do
    get '/courses', headers: authenticated_header_student

    assert_response :success
  end

  test 'should respond success for admin' do
    get '/courses', headers: authenticated_header_admin

    assert_response :success
  end

  test 'should respond unauthorized' do
    get '/courses', headers: unauthenticated_header

    assert_response :unauthorized
  end

  test 'should return assigned courses' do
    course = courses(:one)
    get '/users/' + course.id.to_s + '/courses', headers: authenticated_header_student

    assert_response :success
  end

  test 'should not return unassigned course' do
    course = courses(:two)
    get '/courses/' + course.id.to_s, headers: authenticated_header_student

    assert_response :not_found
  end

  test 'should return all courses when authenticated as admin' do
    get '/courses', headers: authenticated_header_student

    for course in courses()
      assert response.body.include?(c.name)
    end
  end

  test 'should return bad request when the student is trying to update a course' do
    course = courses(:one)
    post_data = {
      data: {
        id: course.id.to_s,
        type: "courses",
        attributes: {
          name: 'nowa nazwa'
        }
      }
    }

    patch '/courses/' + course.id.to_s, params: post_data.to_json, headers: authenticated_header_student

    assert_response :bad_request
  end

  test 'should allow admin to update course' do
    new_name = Faker::Beer.name
    course = courses(:one)
    post_data = {
      data: {
        id: course.id.to_s,
        type: "courses",
        attributes: {
          name: new_name
        }
      }
    }

    patch '/courses/' + course.id.to_s, params: post_data.to_json, headers: authenticated_header_admin

    assert_response :success
    assert response.body.include?(new_name)
  end
end
