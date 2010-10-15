require 'test_helper'

class CheerMessagesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => CheerMessage.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    CheerMessage.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    CheerMessage.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to cheer_message_url(assigns(:cheer_message))
  end
  
  def test_edit
    get :edit, :id => CheerMessage.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    CheerMessage.any_instance.stubs(:valid?).returns(false)
    put :update, :id => CheerMessage.first
    assert_template 'edit'
  end
  
  def test_update_valid
    CheerMessage.any_instance.stubs(:valid?).returns(true)
    put :update, :id => CheerMessage.first
    assert_redirected_to cheer_message_url(assigns(:cheer_message))
  end
  
  def test_destroy
    cheer_message = CheerMessage.first
    delete :destroy, :id => cheer_message
    assert_redirected_to cheer_messages_url
    assert !CheerMessage.exists?(cheer_message.id)
  end
end
