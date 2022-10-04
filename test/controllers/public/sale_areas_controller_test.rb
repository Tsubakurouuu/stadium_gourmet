require "test_helper"

class Public::SaleAreasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_sale_areas_index_url
    assert_response :success
  end

  test "should get show" do
    get public_sale_areas_show_url
    assert_response :success
  end
end
