require 'test_helper'

class PrintsControllerTest < ActionController::TestCase
  def setup
    @print = prints(:senior)
    sign_in users(:admin)
  end

  test "index" do
    get :index
    assert_template 'index'
  end

  test "new" do
    get :new
    assert_template 'new'
  end

  test "create invalid" do
    Print.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  test "create valid" do
    Print.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to prints_url
  end

  test "edit" do
    get :edit, :id => @print
    assert_template 'edit'
  end

  test "update invalid" do
    Print.any_instance.stubs(:valid?).returns(false)
    put :update, :id => @print
    assert_template 'edit'
  end

  test "update valid" do
    Print.any_instance.stubs(:valid?).returns(true)
    put :update, :id => @print
    assert_redirected_to prints_url
  end

  test "destroy" do
    print = @print
    delete :destroy, :id => @print
    assert_redirected_to prints_url
    assert !Print.exists?(@print.id)
  end
end
