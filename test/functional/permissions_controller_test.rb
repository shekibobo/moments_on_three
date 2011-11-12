require 'test_helper'

class PermissionsControllerTest < ActionController::TestCase
  def setup
    @senior_gallery = galleries(:senior_gallery)
    Gallery.stubs(:find).returns(@senior_gallery)
    sign_in users(:molly)
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Permission.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Permission.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to root_url
  end

  def test_edit
    get :edit, :id => @senior_gallery.permissions.first
    assert_template 'edit'
  end

  def test_update_invalid
    Permission.any_instance.stubs(:valid?).returns(false)
    put :update, :gallery_id => @senior_gallery.id, :id => @senior_gallery.permissions.first
    assert_template 'edit'
  end

  def test_update_valid
    Permission.any_instance.stubs(:valid?).returns(true)
    put :update, :id => @senior_gallery.permissions.first
    assert_redirected_to root_url
  end

  def test_destroy
    permission = @senior_gallery.permissions.first
    delete :destroy, :id => permission
    assert_redirected_to root_url
    assert !Permission.exists?(permission.id)
  end
end
