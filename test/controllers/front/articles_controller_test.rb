require "test_helper"

class Front::ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get front_articles_index_url
    assert_response :success
  end

  test "should get show" do
    get front_articles_show_url
    assert_response :success
  end
end
