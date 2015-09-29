require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  test "should get funcheap" do
    get :funcheap
    assert_response :success
  end

  test "should get meetup" do
    get :meetup
    assert_response :success
  end

  test "should get list" do
    get :list
    assert_response :success
  end

  test "should get indybay" do
    get :indybay
    assert_response :success
  end

end
