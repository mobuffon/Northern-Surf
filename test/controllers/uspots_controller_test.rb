require 'test_helper'

class UspotsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get uspots_create_url
    assert_response :success
  end

  test "should get destroy" do
    get uspots_destroy_url
    assert_response :success
  end

end
