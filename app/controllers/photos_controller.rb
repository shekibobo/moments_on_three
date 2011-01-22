class PhotosController < ApplicationController
  before_filter :get_gallery
  before_filter :authenticate_admin!, :except => [ :show, :index ]

  def show
    @photo = @gallery.photos.find(params[:id])
  end

  def new
    @photo = @gallery.photos.build
  end

  def create
    @photo = @gallery.photos.build(params[:photo])
    if @photo.save
      flash[:notice] = "Successfully created photo."
      redirect_to [@gallery, @photo]
    else
      render :action => 'new'
    end
  end

  def edit
    @photo = @gallery.photos.find(params[:id])
  end

  def update
    @photo = @gallery.photos.find(params[:id])
    if @photo.update_attributes(params[:photo])
      flash[:notice] = "Successfully updated photo."
      redirect_to [@gallery, @photo]
    else
      render :action => 'edit'
    end
  end

  def destroy
    @photo = @gallery.photos.find(params[:id])
    @photo.destroy
    flash[:notice] = "Successfully destroyed photo."
    redirect_to gallery_path(@gallery)
  end

  private

  def get_gallery
    @gallery = Gallery.find(params[:gallery_id])
  end
end
