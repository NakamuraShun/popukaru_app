require "test_helper"

class Admin::SlidersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_sliders_index_url
    assert_response :success
  end

  test "should get create" do
    get admin_sliders_create_url
    assert_response :success
  end
end
