class PhotosController < ApplicationController
  before_filter :get_gallery
  before_filter :authenticate_admin!, :except => [ :show ]

  def show
    @photo = @gallery.photos.find(params[:id])
  end

  def new
    @photo = @gallery.photos.build
  end

  def create
    @photo = @gallery.photos.build(params[:photo])
    if @photo.save
      redirect_to [@gallery, @photo], :notice => "Photo successfully added."
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
      redirect_to [@gallery, @photo], :notice => "Photo sucessfully updated."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @photo = @gallery.photos.find(params[:id])
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to [ @gallery ], :notice => "Photo removed." }
      format.js { render :nothing => true }
    end
  end

  private

  def get_gallery
    @gallery = Gallery.find(params[:gallery_id])
  end
end
