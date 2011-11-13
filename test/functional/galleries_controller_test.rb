require 'test_helper'

class GalleriesControllerTest < ActionController::TestCase
  def setup
    @admin = users(:eryn)
    @owner = users(:molly)
    @shared_user = users(:david)
    @unshared_user = users(:owen)
  end

  test "index" do
    get :index
    assert_template 'index'
  end

  test "admin can view a gallery" do
    sign_in @admin
    get :show, :id => Gallery.first
    assert_template 'show'
  end

  test "admin can create a new gallery" do
    sign_in @admin
    get :new
    assert_template 'new'
  end

  test "admin creates an invalid gallery" do
    sign_in @admin
    Gallery.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  test "admin creates a valid gallery" do
    sign_in @admin
    Gallery.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to [:edit, (assigns(:gallery))]
  end

  test "admin can edit a gallery" do
    sign_in @admin
    get :edit, :id => Gallery.first
    assert_template 'edit'
  end

  test "admin updates a gallery with invalid data" do
    sign_in @admin
    Gallery.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Gallery.first
    assert_template 'edit'
  end

  test "admin successfully updates a gallery" do
    sign_in @admin
    Gallery.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Gallery.first
    assert_redirected_to gallery_url(assigns(:gallery))
  end

  test "admin destroys a gallery" do
    sign_in @admin
    gallery = Gallery.first
    delete :destroy, :id => gallery
    assert_redirected_to galleries_url
    assert !Gallery.exists?(gallery.id)
  end
end
