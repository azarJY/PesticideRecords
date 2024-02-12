require "test_helper"

class Farmer::SeasonsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get farmer_seasons_new_url
    assert_response :success
  end
end
