class GalleriesController < ApplicationController
  before_filter :authenticate_admin!, :except => [:show, :index]

  def extract
    @gallery = Gallery.find(params[:id])
    @gallery.extract_photos
    redirect_to @gallery,
      :notice => "Gallery has been successfully creataed."
  end

  def index
    if user_signed_in? && current_user.admin?
      @galleries = Gallery.all
    elsif user_signed_in?
      @owned_galleries = current_user.owned_galleries
    end
  end

  def show
    @gallery = Gallery.find(params[:id])
    @photos = @gallery.photos.all.paginate :per_page => 10,
      :page => params[:page], :order => 'rating DESC'
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(params[:gallery])
    if @gallery.save
      redirect_to [:edit, @gallery],
        :notice => "Successfullty created gallery."
    else
      render :action => 'new'
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])
    if @gallery.update_attributes(params[:gallery])
      flash[:notice] = "Successfully updated gallery."
      redirect_to @gallery
    else
      render :action => 'edit'
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    flash[:notice] = "Successfully destroyed gallery."
    redirect_to galleries_url
  end
end
