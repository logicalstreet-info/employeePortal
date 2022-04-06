require "test_helper"

class PeriodsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get periods_index_url
    assert_response :success
  end

  test "should get new" do
    get periods_new_url
    assert_response :success
  end
end
