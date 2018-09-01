require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get main_profile_url
    assert_response :success
  end

end
