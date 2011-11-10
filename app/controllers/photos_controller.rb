class PhotosController < ApplicationController


  def new
    album = Album.find params[:album_id]

    render locals: { album: album }
  end


  def create
    @photo = Photo.new params[:photo]
    @photo.created_by = current_user

    if @photo.valid? && @photo.save
      redirect_to album_url @photo.album
    else
      render action: :new, locals: { album: @photo.album }
    end
  end


  def view
    photo = Photo.find params[:photo_id]


    render locals: { photo: photo }
  end


  def destroy
    photo = Photo.find params[:photo_id]
    photo.delete

    redirect_to photo.album
  end


  def set_profile
    photo = Photo.find params[:photo_id]

    profile_pic = Photo.create! album: current_user.profile_photos, image_uid: photo.image_uid, created_by: current_user

    redirect_to_back user_url current_user
  end


end
