require 'test_helper'

class OrdersControllerTest < ActionController::TestCase

  def setup
    @order = orders(:andrew_seniors)
    sign_in @order.user
  end

  test "index" do
    get :index
    assert_template 'index'
  end

  test "show" do
    get :show, :id => @order
    assert_template 'show'
  end

  test "new" do
    get :new
    assert_template 'new'
  end

  test "create invalid order" do
    Order.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  test "create valid order" do
    Order.any_instance.stubs(:valid?).returns(true)
    Order.any_instance.stubs(:save).returns(true)
    post :create
    assert_redirected_to assigns(:order)
  end

  test "edit order" do
    get :edit, :id => @order
    assert_template 'edit'
  end

  test "update invalid" do
    Order.any_instance.stubs(:valid?).returns(false)
    put :update, :id => @order
    assert_template 'edit'
  end

  test "update valid" do
    Order.any_instance.stubs(:valid?).returns(true)
    Order.any_instance.stubs(:update_attributes).returns(true)
    put :update, :id => @order
    assert_redirected_to assigns(:order)
  end

  test "destroy" do
    delete :destroy, :id => @order
    assert_redirected_to orders_url
    assert !Order.exists?(@order.id)
  end
end
