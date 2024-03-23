require "test_helper"

class Front::EditorsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get front_editors_show_url
    assert_response :success
  end
end
