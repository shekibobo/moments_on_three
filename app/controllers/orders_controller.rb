class OrdersController < ApplicationController
  before_filter :authenticate_user!

  def index
    if admin_signed_in?
      @orders = Order.all
      @orders_in_progress = Order.find_by_committed(false)
      @unpaid_orders = Order.find_by_committed(true)
      @paid_orders = Order.find_by_paid(true)
    elsif user_signed_in?
      @orders = current_user.orders
      @orders_in_progress = current_user.orders.find_by_committed(false)
      @unpaid_orders = current_user.orders.find_by_committed(true) - current_user.orders.find_by_paid(true)
      @paid_orders = current_user.orders.find_by_paid(true)
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def new
    @order = Order.new
    @order_items = @order.order_items
  end

  def create
    @order = Order.new(params[:order])
    if @order.save
      flash[:notice] = "Order created."
      redirect_to @order
    else
      render :action => 'new'
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(params[:order])
      flash[:notice] = "Successfully updated order."
      redirect_to @order
    else
      render :action => 'edit'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    flash[:notice] = "Order canceled."
    redirect_to orders_url
  end

end
