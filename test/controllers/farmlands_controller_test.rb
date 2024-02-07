require "test_helper"

class FarmlandsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get farmlands_index_url
    assert_response :success
  end

  test "should get new" do
    get farmlands_new_url
    assert_response :success
  end

  test "should get show" do
    get farmlands_show_url
    assert_response :success
  end
end
