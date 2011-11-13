class OrderItemsController < ApplicationController
  before_filter :get_order

  def new
    @order_item = @order.order_items.build(params)
  end

  def create
    @order_item = @order.order_items.build(params[:order_item])
    if @order_item.save
      @order.save
      flash[:notice] = "Successfully created order item."
      redirect_to @order
    else
      render :action => 'new'
    end
  end

  def edit
    @order_item = OrderItem.find(params[:id])
  end

  def update
    @order_item = OrderItem.find(params[:id])
    if @order_item.update_attributes(params[:order_item])
      @order.save
      flash[:notice] = "Successfully updated order item."
      redirect_to @order
    else
      render :action => 'edit'
    end
  end

  def destroy
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    respond_to do |format|
      format.html { redirect_to @order, :notice => "Print removed." }
      format.js { render :nothing => true }
    end
  end

  private
  def get_order
    @order = Order.find(params[:order_id])
  end
end
