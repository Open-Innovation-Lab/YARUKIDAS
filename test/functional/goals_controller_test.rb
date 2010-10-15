require 'test_helper'

class GoalsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Goal.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Goal.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Goal.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to goal_url(assigns(:goal))
  end
  
  def test_edit
    get :edit, :id => Goal.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Goal.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Goal.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Goal.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Goal.first
    assert_redirected_to goal_url(assigns(:goal))
  end
  
  def test_destroy
    goal = Goal.first
    delete :destroy, :id => goal
    assert_redirected_to goals_url
    assert !Goal.exists?(goal.id)
  end
end
