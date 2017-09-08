require 'test_helper'

class SessoinsControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get sessoins_login_url
    assert_response :success
  end

end
