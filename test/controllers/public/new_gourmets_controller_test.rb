require "test_helper"

class Public::NewGourmetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_new_gourmets_index_url
    assert_response :success
  end
end
