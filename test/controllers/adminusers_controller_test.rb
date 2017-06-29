require 'test_helper'

class AdminusersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get adminusers_index_url
    assert_response :success
  end

  test "should get new" do
    get adminusers_new_url
    assert_response :success
  end

  test "should get create" do
    get adminusers_create_url
    assert_response :success
  end

  test "should get edit" do
    get adminusers_edit_url
    assert_response :success
  end

  test "should get update" do
    get adminusers_update_url
    assert_response :success
  end

  test "should get delete" do
    get adminusers_delete_url
    assert_response :success
  end

  test "should get destroy" do
    get adminusers_destroy_url
    assert_response :success
  end

end
