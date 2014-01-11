require 'test_helper'

class StyleguidesControllerTest < ActionController::TestCase
  setup do
    @styleguide = styleguides(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:styleguides)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create styleguide" do
    assert_difference('Styleguide.count') do
      post :create, styleguide: { title: @styleguide.title, user_id: @styleguide.user_id }
    end

    assert_redirected_to styleguide_path(assigns(:styleguide))
  end

  test "should show styleguide" do
    get :show, id: @styleguide
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @styleguide
    assert_response :success
  end

  test "should update styleguide" do
    patch :update, id: @styleguide, styleguide: { title: @styleguide.title, user_id: @styleguide.user_id }
    assert_redirected_to styleguide_path(assigns(:styleguide))
  end

  test "should destroy styleguide" do
    assert_difference('Styleguide.count', -1) do
      delete :destroy, id: @styleguide
    end

    assert_redirected_to styleguides_path
  end
end
