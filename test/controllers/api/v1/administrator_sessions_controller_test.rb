require 'test_helper'

class Api::V1::AdministratorSessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    post api_v1_administrator_sessions_create_url
    assert_response :success
  end

  test 'should get destroy' do
    delete api_v1_administrator_sessions_destroy_url
    assert_response :success
  end
end
