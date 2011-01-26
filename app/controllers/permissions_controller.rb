class PermissionsController < ApplicationController
  before_filter :get_gallery
  before_filter :authenticate_user!
  before_filter :authenticate_owner!

  def new
    @permission = @gallery.permissions.build
  end

  def create
    @permission = @gallery.permissions.build(params[:permission])
    if @permission.save
      redirect_to root_url, :notice => "Permissions granted."
    else
      render :action => 'new'
    end
  end

  def edit
    @permission = @gallery.permissions.find(params[:id])
  end

  def show
    @permission = @gallery.permissions.find(params[:id])
  end

  def update
    @permission = @gallery.permissions.find(params[:id])
    if @permission.update_attributes(params[:permission])
      redirect_to @gallery, :notice => "Permissions updated."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @permission = @gallery.permissions.find(params[:id])
    @permission.destroy
    redirect_to root_url, :notice => "Permissions revoked."
  end

  private
  def get_gallery
    @gallery = Gallery.find(params[:gallery_id])
  end

  def authenticate_owner!
    if @gallery.owner? current_user
      return true
    end
    redirect_to @gallery,
      :flash => "Only authorized users can manage gallery permissions."
    return false
  end
end
