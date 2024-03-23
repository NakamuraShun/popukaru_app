require "test_helper"

class Front::NoticesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get front_notices_index_url
    assert_response :success
  end

  test "should get show" do
    get front_notices_show_url
    assert_response :success
  end
end
