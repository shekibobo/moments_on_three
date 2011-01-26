class CategoriesController < ApplicationController
  before_filter :authenticate_admin!, :except => :show

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by_name(params[:name]) || Category.find(params[:id])
    unless @category.name == 'theatre'
      @photos = Photo.tagged_with('sample').reject { |p| p.category != @category }
    else
      @galleries = Category.find_by_name('theatre').galleries
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to @category, :notice => "Category created."
    else
      render :action => 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to @category, :notice => "Category updated."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_url, :notice => "Category removed."
  end
end
