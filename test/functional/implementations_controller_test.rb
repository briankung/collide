require 'test_helper'

class ImplementationsControllerTest < ActionController::TestCase
  setup do
    @implementation = implementations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:implementations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create implementation" do
    assert_difference('Implementation.count') do
      post :create, implementation: { description: @implementation.description, live_url: @implementation.live_url, name: @implementation.name, source_code: @implementation.source_code, source_url: @implementation.source_url }
    end

    assert_redirected_to implementation_path(assigns(:implementation))
  end

  test "should show implementation" do
    get :show, id: @implementation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @implementation
    assert_response :success
  end

  test "should update implementation" do
    put :update, id: @implementation, implementation: { description: @implementation.description, live_url: @implementation.live_url, name: @implementation.name, source_code: @implementation.source_code, source_url: @implementation.source_url }
    assert_redirected_to implementation_path(assigns(:implementation))
  end

  test "should destroy implementation" do
    assert_difference('Implementation.count', -1) do
      delete :destroy, id: @implementation
    end

    assert_redirected_to implementations_path
  end
end
