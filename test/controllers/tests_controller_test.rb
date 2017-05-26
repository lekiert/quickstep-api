require 'test_helper'

class TestsControllerTest < ActionDispatch::IntegrationTest
  def authenticated_header_student
    token = Knock::AuthToken.new(payload: { sub: users(:one).id }).token

    {
      'Accept': 'application/vnd.api+json',
      'Authorization': "Bearer #{token}",
      'Content-Type': 'application/vnd.api+json',
    }
  end

  def authenticated_header_admin
    token = Knock::AuthToken.new(payload: { sub: users(:admin).id }).token

    {
      'Accept': 'application/vnd.api+json',
      'Authorization': "Bearer #{token}",
      'Content-Type': 'application/vnd.api+json',
    }
  end

  def unauthenticated_header
    {
      'Accept': 'application/vnd.api+json',
    }
  end

  test 'should respond success' do
    get '/tests', headers: authenticated_header_student

    assert_response :success
  end

  test 'should respond unauthorized' do
    get '/tests', headers: unauthenticated_header

    assert_response :unauthorized
  end

  test 'should return test from assigned course' do
    test_ = tests(:one)
    get '/tests/' + test_.id.to_s , headers: authenticated_header_student

    assert_response :success
  end

  test 'should not return test from unassigned course' do
    test_ = tests(:two)
    get '/tests/' + test_.id.to_s, headers: authenticated_header_student

    assert_response :not_found
  end

  test 'should return unassigned course for admin' do
    test_ = tests(:two)
    get '/tests/' + test_.id.to_s, headers: authenticated_header_admin

    assert_response :success
  end


  test 'should return bad request when the student is trying to update a test' do
    test_ = tests(:one)
    post_data = {
      data: {
        id: test_.id.to_s,
        type: "tests",
        attributes: {
          name: 'nowa nazwa',
          code: 'AAA'
        }
      }
    }

    patch '/tests/' + test_.id.to_s, params: post_data.to_json, headers: authenticated_header_student

    assert_response :bad_request
  end

  test 'should allow admin to update course' do
    new_name = Faker::Beer.name
    test_ = tests(:one)
    post_data = {
      data: {
        id: test_.id.to_s,
        type: "tests",
        attributes: {
          name: new_name,
          code: 'AAA'
        }
      }
    }

    patch '/tests/' + test_.id.to_s, params: post_data.to_json, headers: authenticated_header_admin

    assert_response :success
    assert response.body.include?(new_name)
  end
end
