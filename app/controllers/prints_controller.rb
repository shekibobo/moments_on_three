class PrintsController < ApplicationController
  def index
    @prints = Print.all
  end
  
  def show
    @print = Print.find(params[:id])
  end
  
  def new
    @print = Print.new
  end
  
  def create
    @print = Print.new(params[:print])
    if @print.save
      flash[:notice] = "Successfully created print."
      redirect_to @print
    else
      render :action => 'new'
    end
  end
  
  def edit
    @print = Print.find(params[:id])
  end
  
  def update
    @print = Print.find(params[:id])
    if @print.update_attributes(params[:print])
      flash[:notice] = "Successfully updated print."
      redirect_to @print
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @print = Print.find(params[:id])
    @print.destroy
    flash[:notice] = "Successfully destroyed print."
    redirect_to prints_url
  end
end
