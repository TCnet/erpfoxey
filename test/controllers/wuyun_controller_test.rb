require "test_helper"

class WuyunControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wuyun_index_url
    assert_response :success
  end
end
