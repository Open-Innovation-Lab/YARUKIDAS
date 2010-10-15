require 'test_helper'

class CheerLogsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cheer_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cheer_log" do
    assert_difference('CheerLog.count') do
      post :create, :cheer_log => { }
    end

    assert_redirected_to cheer_log_path(assigns(:cheer_log))
  end

  test "should show cheer_log" do
    get :show, :id => cheer_logs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => cheer_logs(:one).to_param
    assert_response :success
  end

  test "should update cheer_log" do
    put :update, :id => cheer_logs(:one).to_param, :cheer_log => { }
    assert_redirected_to cheer_log_path(assigns(:cheer_log))
  end

  test "should destroy cheer_log" do
    assert_difference('CheerLog.count', -1) do
      delete :destroy, :id => cheer_logs(:one).to_param
    end

    assert_redirected_to cheer_logs_path
  end
end
