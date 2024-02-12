require "test_helper"

class Farmer::PesticidesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get farmer_pesticides_index_url
    assert_response :success
  end

  test "should get new" do
    get farmer_pesticides_new_url
    assert_response :success
  end

  test "should get show" do
    get farmer_pesticides_show_url
    assert_response :success
  end
end
