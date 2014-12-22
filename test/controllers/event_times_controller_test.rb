require 'test_helper'

class EventTimesControllerTest < ActionController::TestCase
  setup do
    @event_time = event_times(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_times)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_time" do
    assert_difference('EventTime.count') do
      post :create, event_time: { end_time: @event_time.end_time, max_participants: @event_time.max_participants, start_time: @event_time.start_time }
    end

    assert_redirected_to event_time_path(assigns(:event_time))
  end

  test "should show event_time" do
    get :show, id: @event_time
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_time
    assert_response :success
  end

  test "should update event_time" do
    patch :update, id: @event_time, event_time: { end_time: @event_time.end_time, max_participants: @event_time.max_participants, start_time: @event_time.start_time }
    assert_redirected_to event_time_path(assigns(:event_time))
  end

  test "should destroy event_time" do
    assert_difference('EventTime.count', -1) do
      delete :destroy, id: @event_time
    end

    assert_redirected_to event_times_path
  end
end
