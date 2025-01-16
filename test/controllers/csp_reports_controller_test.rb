require "test_helper"

class CspReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get csp_reports_create_url
    assert_response :success
  end
end
