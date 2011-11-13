require 'test_helper'

class GalleriesControllerTest < ActionController::TestCase
  def setup
    @admin = users(:eryn)
    @owner = users(:molly)
    @shared_user = users(:david)
    @unshared_user = users(:owen)
  end

  def test_index
    get :index
    assert_template 'index'
  end

  def test_show_for_admin
    sign_in @admin
    get :show, :id => Gallery.first
    assert_template 'show'
  end

  def test_new_for_admin
    sign_in @admin
    get :new
    assert_template 'new'
  end

  def test_create_invalid_for_admin
    sign_in @admin
    Gallery.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid_for_admin
    sign_in @admin
    Gallery.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to [:edit, (assigns(:gallery))]
  end

  def test_edit_for_admin
    sign_in @admin
    get :edit, :id => Gallery.first
    assert_template 'edit'
  end

  def test_update_invalid_for_admin
    sign_in @admin
    Gallery.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Gallery.first
    assert_template 'edit'
  end

  def test_update_valid_for_admin
    sign_in @admin
    Gallery.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Gallery.first
    assert_redirected_to gallery_url(assigns(:gallery))
  end

  def test_destroy_for_admin
    sign_in @admin
    gallery = Gallery.first
    delete :destroy, :id => gallery
    assert_redirected_to galleries_url
    assert !Gallery.exists?(gallery.id)
  end
end
