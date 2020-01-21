require 'test_helper'

class GoodfeelingsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get goodfeelings_create_url
    assert_response :success
  end

end
