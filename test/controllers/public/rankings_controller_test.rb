require "test_helper"

class Public::RankingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_rankings_index_url
    assert_response :success
  end

  test "should get show" do
    get public_rankings_show_url
    assert_response :success
  end
end
