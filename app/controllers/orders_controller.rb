class OrdersController < ApplicationController
  def index
    if admin_signed_in?
      @orders_in_progress = Order.find_by_committed(false)
      @unpaid_orders = Order.find_by_committed(true).find_by_paid(false)
      @paid_orders = Order.find_by_paid(true)
    elsif user_signed_in?
      @orders_in_progress = current_user.orders.find_by_committed(false)
      @unpaid_orders = current_user.orders.find_by_committed(true).find_by_paid(false)
      @paid_orders = current_user.orders.find_by_paid(true)
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @order_items = @order.order_items
  end

  def create
    @order = Order.new(params[:order])
    if @order.save
      flash[:notice] = "Successfully created order."
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
    flash[:notice] = "Successfully destroyed order."
    redirect_to orders_url
  end
end
