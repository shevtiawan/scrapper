require 'test_helper'

class StatisticsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statistics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create statistic" do
    assert_difference('Statistic.count') do
      post :create, :statistic => { }
    end

    assert_redirected_to statistic_path(assigns(:statistic))
  end

  test "should show statistic" do
    get :show, :id => statistics(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => statistics(:one).id
    assert_response :success
  end

  test "should update statistic" do
    put :update, :id => statistics(:one).id, :statistic => { }
    assert_redirected_to statistic_path(assigns(:statistic))
  end

  test "should destroy statistic" do
    assert_difference('Statistic.count', -1) do
      delete :destroy, :id => statistics(:one).id
    end

    assert_redirected_to statistics_path
  end
end
