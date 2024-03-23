require "test_helper"

class Admin::EditorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_editors_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_editors_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_editors_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_editors_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_editors_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_editors_destroy_url
    assert_response :success
  end
end
