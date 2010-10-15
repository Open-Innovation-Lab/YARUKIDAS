require 'test_helper'

class TrainersMessagesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => TrainersMessage.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    TrainersMessage.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    TrainersMessage.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to trainers_message_url(assigns(:trainers_message))
  end
  
  def test_edit
    get :edit, :id => TrainersMessage.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    TrainersMessage.any_instance.stubs(:valid?).returns(false)
    put :update, :id => TrainersMessage.first
    assert_template 'edit'
  end
  
  def test_update_valid
    TrainersMessage.any_instance.stubs(:valid?).returns(true)
    put :update, :id => TrainersMessage.first
    assert_redirected_to trainers_message_url(assigns(:trainers_message))
  end
  
  def test_destroy
    trainers_message = TrainersMessage.first
    delete :destroy, :id => trainers_message
    assert_redirected_to trainers_messages_url
    assert !TrainersMessage.exists?(trainers_message.id)
  end
end
