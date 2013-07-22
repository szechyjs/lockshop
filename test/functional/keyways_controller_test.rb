require 'test_helper'

class KeywaysControllerTest < ActionController::TestCase
  setup do
    @keyway = keyways(:H)
    sign_in users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:keyways)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create keyway" do
    assert_difference('Keyway.count') do
      post :create, :keyway => @keyway.attributes
    end

    assert_redirected_to keyway_path(assigns(:keyway))
  end

  test "should show keyway" do
    get :show, :id => @keyway.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @keyway.to_param
    assert_response :success
  end

  test "should update keyway" do
    put :update, :id => @keyway.to_param, :keyway => @keyway.attributes
    assert_redirected_to keyway_path(assigns(:keyway))
  end

  test "should destroy keyway" do
    assert_difference('Keyway.count', -1) do
      delete :destroy, :id => @keyway.to_param
    end

    assert_redirected_to keyways_path
  end
end
