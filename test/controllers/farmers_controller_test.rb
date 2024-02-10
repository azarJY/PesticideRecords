require "test_helper"

class FarmersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get farmers_show_url
    assert_response :success
  end

  test "should get edit" do
    get farmers_edit_url
    assert_response :success
  end

  test "should get confirm" do
    get farmers_confirm_url
    assert_response :success
  end

  test "should get unsubscrided" do
    get farmers_unsubscrided_url
    assert_response :success
  end
end
