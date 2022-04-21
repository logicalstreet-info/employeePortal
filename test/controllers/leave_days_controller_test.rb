require "test_helper"

class LeaveDaysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get leave_days_index_url
    assert_response :success
  end
end
