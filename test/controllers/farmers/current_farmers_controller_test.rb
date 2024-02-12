require "test_helper"

class Farmers::CurrentFarmersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get farmers_current_farmers_show_url
    assert_response :success
  end

  test "should get edit" do
    get farmers_current_farmers_edit_url
    assert_response :success
  end

  test "should get confirm" do
    get farmers_current_farmers_confirm_url
    assert_response :success
  end
end
