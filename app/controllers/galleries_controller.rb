class GalleriesController < ApplicationController
  before_filter :authenticate_admin!, :except => [:show, :index]
  before_filter :authenticate_viewers!, :only => [ :show ]

  def index
    if admin_signed_in?
      @galleries = Gallery.all
    elsif user_signed_in?
      @owned_galleries = current_user.owned_galleries
      @shared_galleries = current_user.shared_galleries
    end
  end

  def show
    @gallery = Gallery.find(params[:id])
    @photos = @gallery.photos.all.paginate :per_page => 12,
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
      redirect_to @gallery, :notice => "Gallery update successful."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    redirect_to galleries_url, :notice => "Gallery destroyed."
  end

  private
  def authenticate_viewers!
    if user_signed_in? && current_user.can_view?(Gallery.find(params[:id]))
      return true
    end
    redirect_to root_url,
      :notice => "You must have permission to view this gallery."
    return false

  end
end
