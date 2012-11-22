require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
  end

end
