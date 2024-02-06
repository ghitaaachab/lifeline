require "test_helper"

class UserReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_reports_show_url
    assert_response :success
  end
end
