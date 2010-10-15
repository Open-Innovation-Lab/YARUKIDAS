require 'test_helper'

class UserCommentsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => UserComment.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    UserComment.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    UserComment.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to user_comment_url(assigns(:user_comment))
  end
  
  def test_edit
    get :edit, :id => UserComment.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    UserComment.any_instance.stubs(:valid?).returns(false)
    put :update, :id => UserComment.first
    assert_template 'edit'
  end
  
  def test_update_valid
    UserComment.any_instance.stubs(:valid?).returns(true)
    put :update, :id => UserComment.first
    assert_redirected_to user_comment_url(assigns(:user_comment))
  end
  
  def test_destroy
    user_comment = UserComment.first
    delete :destroy, :id => user_comment
    assert_redirected_to user_comments_url
    assert !UserComment.exists?(user_comment.id)
  end
end
