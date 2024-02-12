require "test_helper"

class Farmer::FarmlandsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get farmer_farmlands_index_url
    assert_response :success
  end

  test "should get new" do
    get farmer_farmlands_new_url
    assert_response :success
  end

  test "should get show" do
    get farmer_farmlands_show_url
    assert_response :success
  end
end
