require 'test_helper'

class PhotosControllerTest < ActionController::TestCase
  def setup
    Photo.any_instance.stubs(:set_orientation).returns('portrait')
    Photo.any_instance.stubs(:name).returns(:name => "test_photo.jpg")
    @photo = photos(:senior_photo_one)
    @gallery = @photo.gallery
    Gallery.stubs(:find).returns(@gallery)
    @admin = users(:eryn)
  end

  def test_show
    sign_in @admin
    get :show, :gallery_id => @gallery, :id => @photo
    assert_template 'show'
  end

  def test_new
    sign_in @admin
    get :new, :gallery_id => @gallery
    assert_template 'new'
  end

  def test_create_invalid
    sign_in @admin
    Photo.any_instance.stubs(:valid?).returns(false)
    post :create, :gallery_id => @gallery
    assert_template 'new'
  end

  def test_create_valid
    sign_in @admin
    Photo.any_instance.stubs(:valid?).returns(true)
    post :create, :gallery_id => @gallery
    assert_redirected_to [assigns(:gallery), assigns(:photo)]
  end

  def test_edit
    sign_in @admin
    get :edit, :gallery_id => @gallery, :id => @photo
    assert_template 'edit'
  end

  def test_update_invalid
    sign_in @admin
    Photo.any_instance.stubs(:valid?).returns(false)
    put :update, :gallery_id => @gallery, :id => @photo
    assert_template 'edit'
  end

  def test_update_valid
    sign_in @admin
    Photo.any_instance.stubs(:valid?).returns(true)
    put :update, :gallery_id => @gallery, :id => @photo
    assert_redirected_to [assigns(:gallery), assigns(:photo)]
  end

  def test_destroy
    sign_in @admin
    delete :destroy, :gallery_id => @gallery, :id => @photo
    assert_redirected_to assigns(:gallery)
    assert !Photo.exists?(@photo.id)
  end
end
