require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get home_site" do
    get :home_site
    assert_response :success
  end

end
