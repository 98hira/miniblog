require 'test_helper'

class MiniblogControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get miniblog_index_url
    assert_response :success
  end

end
