require "test_helper"

class Admin::PickupArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_pickup_articles_index_url
    assert_response :success
  end

  test "should get create" do
    get admin_pickup_articles_create_url
    assert_response :success
  end
end
