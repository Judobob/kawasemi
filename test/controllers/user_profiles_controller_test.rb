require 'test_helper'

class UserProfilesControllerTest < ActionController::TestCase
  setup do
    @user_profile = user_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_profile" do
    assert_difference('UserProfile.count') do
      post :create, user_profile: { adddress_2: @user_profile.adddress_2, address_1: @user_profile.address_1, city: @user_profile.city, country_id: @user_profile.country_id, county: @user_profile.county, email: @user_profile.email, first_name: @user_profile.first_name, postcode: @user_profile.postcode, second_name: @user_profile.second_name, telephone: @user_profile.telephone }
    end

    assert_redirected_to user_profile_path(assigns(:user_profile))
  end

  test "should show user_profile" do
    get :show, id: @user_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_profile
    assert_response :success
  end

  test "should update user_profile" do
    patch :update, id: @user_profile, user_profile: { adddress_2: @user_profile.adddress_2, address_1: @user_profile.address_1, city: @user_profile.city, country_id: @user_profile.country_id, county: @user_profile.county, email: @user_profile.email, first_name: @user_profile.first_name, postcode: @user_profile.postcode, second_name: @user_profile.second_name, telephone: @user_profile.telephone }
    assert_redirected_to user_profile_path(assigns(:user_profile))
  end

  test "should destroy user_profile" do
    assert_difference('UserProfile.count', -1) do
      delete :destroy, id: @user_profile
    end

    assert_redirected_to user_profiles_path
  end
end
