require 'test_helper'

class AdministratorSessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    post administrator_sessions_create_url
    assert_response :success
  end

  test 'should get destroy' do
    delete administrator_sessions_destroy_url
    assert_response :success
  end
end
