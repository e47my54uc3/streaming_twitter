require 'test_helper'

class TweetsControllerTest < ActionController::TestCase
  test "should get stream" do
    get :stream
    assert_response :success
  end

end
