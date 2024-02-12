require "test_helper"

class Farmer::RecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get farmer_records_index_url
    assert_response :success
  end

  test "should get new" do
    get farmer_records_new_url
    assert_response :success
  end

  test "should get confirm" do
    get farmer_records_confirm_url
    assert_response :success
  end

  test "should get show" do
    get farmer_records_show_url
    assert_response :success
  end

  test "should get edit" do
    get farmer_records_edit_url
    assert_response :success
  end
end
