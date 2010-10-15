require 'test_helper'

class TrainersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Trainer.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Trainer.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Trainer.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to trainer_url(assigns(:trainer))
  end
  
  def test_edit
    get :edit, :id => Trainer.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Trainer.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Trainer.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Trainer.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Trainer.first
    assert_redirected_to trainer_url(assigns(:trainer))
  end
  
  def test_destroy
    trainer = Trainer.first
    delete :destroy, :id => trainer
    assert_redirected_to trainers_url
    assert !Trainer.exists?(trainer.id)
  end
end
