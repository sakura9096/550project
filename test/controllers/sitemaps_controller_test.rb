require 'test_helper'

class SitemapsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
