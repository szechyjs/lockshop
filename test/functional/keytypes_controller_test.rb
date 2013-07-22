require 'test_helper'

class KeytypesControllerTest < ActionController::TestCase
  setup do
    @keytype = keytypes(:change)
    sign_in users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:keytypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create keytype" do
    assert_difference('Keytype.count') do
      post :create, :keytype => @keytype.attributes
    end

    assert_redirected_to keytype_path(assigns(:keytype))
  end

  test "should show keytype" do
    get :show, :id => @keytype.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @keytype.to_param
    assert_response :success
  end

  test "should update keytype" do
    put :update, :id => @keytype.to_param, :keytype => @keytype.attributes
    assert_redirected_to keytype_path(assigns(:keytype))
  end

  test "should destroy keytype" do
    assert_difference('Keytype.count', -1) do
      delete :destroy, :id => @keytype.to_param
    end

    assert_redirected_to keytypes_path
  end
end
