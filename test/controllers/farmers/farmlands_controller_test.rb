require "test_helper"

class Farmers::FarmlandsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get farmers_farmlands_index_url
    assert_response :success
  end

  test "should get new" do
    get farmers_farmlands_new_url
    assert_response :success
  end

  test "should get show" do
    get farmers_farmlands_show_url
    assert_response :success
  end
end
