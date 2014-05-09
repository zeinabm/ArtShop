require 'test_helper'

class CartingsControllerTest < ActionController::TestCase
  setup do
    @carting = cartings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cartings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create carting" do
    assert_difference('Carting.count') do
      post :create, carting: { item_id: @carting.item_id, quantity: @carting.quantity, user_id: @carting.user_id }
    end

    assert_redirected_to carting_path(assigns(:carting))
  end

  test "should show carting" do
    get :show, id: @carting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @carting
    assert_response :success
  end

  test "should update carting" do
    patch :update, id: @carting, carting: { item_id: @carting.item_id, quantity: @carting.quantity, user_id: @carting.user_id }
    assert_redirected_to carting_path(assigns(:carting))
  end

  test "should destroy carting" do
    assert_difference('Carting.count', -1) do
      delete :destroy, id: @carting
    end

    assert_redirected_to cartings_path
  end
end
