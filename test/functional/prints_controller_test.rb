require 'test_helper'

class PrintsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Print.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Print.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Print.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to print_url(assigns(:print))
  end
  
  def test_edit
    get :edit, :id => Print.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Print.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Print.first
    assert_template 'edit'
  end

  def test_update_valid
    Print.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Print.first
    assert_redirected_to print_url(assigns(:print))
  end
  
  def test_destroy
    print = Print.first
    delete :destroy, :id => print
    assert_redirected_to prints_url
    assert !Print.exists?(print.id)
  end
end
