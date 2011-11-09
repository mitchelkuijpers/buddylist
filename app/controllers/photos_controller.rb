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
      render action: :new
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

    if current_user.profile_photos.nil?
      current_user.profile_photos = Album.create! title: "Profile pictures", protected: true, user: current_user
      current_user.save!
    end

    profile_pic = photo.dup
    profile_pic.album = current_user.profile_photos
    profile_pic.save!

    redirect_to_back user_url current_user
  end


end
