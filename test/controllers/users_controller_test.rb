require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get list_user" do
    get users_list_user_url
    assert_response :success
  end

  test "should get create_user" do
    get users_create_user_url
    assert_response :success
  end

  test "should get update_user" do
    get users_update_user_url
    assert_response :success
  end

  test "should get get_user" do
    get users_get_user_url
    assert_response :success
  end

  test "should get delete_user" do
    get users_delete_user_url
    assert_response :success
  end

end
