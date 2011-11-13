require 'test_helper'

class PermissionsControllerTest < ActionController::TestCase
  def setup
    @gallery = galleries(:senior_gallery)
    Gallery.stubs(:find).returns(@gallery)
    sign_in @gallery.owner
  end

  def test_new
    get :new, :gallery => @gallery
    assert_template 'new'
  end

  def test_create_invalid
    Permission.any_instance.stubs(:valid?).returns(false)
    post :create, :gallery => @gallery
    assert_template 'new'
  end

  def test_create_valid
    Permission.any_instance.stubs(:valid?).returns(true)
    Permission.any_instance.stubs(:save).returns(true)
    post :create, :gallery => @gallery
    assert_redirected_to assigns(:gallery)
  end

  def test_edit
    get :edit, :gallery => @gallery, :id => @gallery.permissions.first
    assert_template 'edit'
  end

  def test_update_invalid
    Permission.any_instance.stubs(:valid?).returns(false)
    Permission.any_instance.stubs(:save).returns(false)
    put :update, :gallery => @gallery, :id => @gallery.permissions.first
    assert_template 'edit'
  end

  def test_update_valid
    Permission.any_instance.stubs(:valid?).returns(true)
    Permission.any_instance.stubs(:update_attributes).returns(true)
    put :update, :gallery => @gallery, :id => @gallery.permissions.first
    assert_redirected_to assigns(:gallery)
  end

  def test_destroy
    permission = @gallery.permissions.first
    delete :destroy, :gallery => @gallery, :id => permission
    assert_redirected_to assigns(:gallery)
    assert !Permission.exists?(permission.id)
  end
end
