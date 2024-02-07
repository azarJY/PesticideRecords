require "test_helper"

class PesticidesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pesticides_index_url
    assert_response :success
  end

  test "should get new" do
    get pesticides_new_url
    assert_response :success
  end

  test "should get show" do
    get pesticides_show_url
    assert_response :success
  end
end
