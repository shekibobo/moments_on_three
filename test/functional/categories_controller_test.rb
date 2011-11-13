require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  def setup
    @admin = users(:eryn)
    @owner = users(:molly)
    @shared_user = users(:david)
    @unshared_user = users(:owen)
  end

  def test_index
    sign_in @admin
    get :index
    assert_template 'index'
  end

  def test_show
    sign_in @admin
    get :show, :id => Category.first
    assert_template 'show'
  end

  def test_new
    sign_in @admin
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    sign_in @admin
    Category.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    sign_in @admin
    Category.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to category_url(assigns(:category))
  end

  def test_edit
    sign_in @admin
    get :edit, :id => Category.first
    assert_template 'edit'
  end

  def test_update_invalid
    sign_in @admin
    Category.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Category.first
    assert_template 'edit'
  end

  def test_update_valid
    sign_in @admin
    Category.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Category.first
    assert_redirected_to category_url(assigns(:category))
  end

  def test_destroy
    sign_in @admin
    category = Category.first
    delete :destroy, :id => category
    assert_redirected_to categories_url
    assert !Category.exists?(category.id)
  end
end
