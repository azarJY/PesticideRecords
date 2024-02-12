require "test_helper"

class Farmers::PesticidesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get farmers_pesticides_index_url
    assert_response :success
  end

  test "should get new" do
    get farmers_pesticides_new_url
    assert_response :success
  end

  test "should get show" do
    get farmers_pesticides_show_url
    assert_response :success
  end
end
