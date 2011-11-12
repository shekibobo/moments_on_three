#require 'test_helper'
#
#class PhotosControllerTest < ActionController::TestCase
#  def setup
#    @gallery = Gallery.first
#  end
#
#  def test_show
#    get :show, :id => @gallery.photos.first
#    assert_template 'show'
#  end
#
#  def test_new
#    get :new
#    assert_template 'new'
#  end
#
#  def test_create_invalid
#    Photo.any_instance.stubs(:valid?).returns(false)
#    post :create
#    assert_template 'new'
#  end
#
#  def test_create_valid
#    Photo.any_instance.stubs(:valid?).returns(true)
#    post :create
#    assert_redirected_to photo_url(assigns(:photo))
#  end
#
#  def test_edit
#    get :edit, :id => @gallery.photos.first
#    assert_template 'edit'
#  end
#
#  def test_update_invalid
#    Photo.any_instance.stubs(:valid?).returns(false)
#    put :update, :id => @gallery.photos.first
#    assert_template 'edit'
#  end
#
#  def test_update_valid
#    Photo.any_instance.stubs(:valid?).returns(true)
#    put :update, :id => @gallery.photos.first
#    assert_redirected_to gallery_photo_url(assigns(:gallery, :photo))
#  end
#
#  def test_destroy
#    photo = @gallery.photos.first
#    delete :destroy, :id => photo
#    assert_redirected_to gallery_photos_url
#    assert !Photo.exists?(photo.id)
#  end
#end
