require 'test_helper'

class OrderItemsControllerTest < ActionController::TestCase
  def setup
    sign_in users(:andrew)
    @order = orders(:andrew_seniors)
    @order_item = @order.order_items.first
    @photo = photos(:senior_photo_one)
  end

  test "new" do
    get :new, :order_id => @order
    assert_template 'new'
  end

  def test_create_invalid
    OrderItem.any_instance.stubs(:valid?).returns(false)
    post :create, :order_id => @order
    assert_template 'new'
  end

  def test_create_valid
    OrderItem.any_instance.stubs(:print).returns(prints(:wallets))
    OrderItem.any_instance.stubs(:valid?).returns(true)
    post :create, :order_id => @order, :photo_id => @photo.id
    assert_redirected_to assigns(:order)
  end

  def test_edit
    get :edit, :order_id => @order, :id => @order_item
    assert_template 'edit'
  end

  def test_update_invalid
    OrderItem.any_instance.stubs(:valid?).returns(false)
    put :update, :order_id => @order, :id => @order_item
    assert_template 'edit'
  end

  def test_update_valid
    OrderItem.any_instance.stubs(:valid?).returns(true)
    put :update, :order_id => @order, :id => @order_item
    assert_redirected_to assigns(:order)
  end

  def test_destroy
    delete :destroy, :order_id => @order, :id => @order_item
    assert_redirected_to @order
    assert !OrderItem.exists?(@order_item.id)
  end
end
