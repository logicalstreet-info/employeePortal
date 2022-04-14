require "test_helper"

class LeaveApplicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get leave_applications_index_url
    assert_response :success
  end

  test "should get new" do
    get leave_applications_new_url
    assert_response :success
  end
end
