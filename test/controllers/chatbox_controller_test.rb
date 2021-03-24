require "test_helper"

class ChatboxControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chatbox_index_url
    assert_response :success
  end
end
