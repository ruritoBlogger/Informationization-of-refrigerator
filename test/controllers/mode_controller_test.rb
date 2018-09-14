require 'test_helper'

class ModeControllerTest < ActionDispatch::IntegrationTest
  test "should get editmode2" do
    get mode_editmode2_url
    assert_response :success
  end

end
