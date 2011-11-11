class PhotosController < ApplicationController


  def new
    album = Album.find params[:album_id]

    render locals: { album: album }
  end


  def create
    @photo = Photo.new params[:photo]
    @photo.created_by = current_user

    if @photo.valid? && @photo.save

      # If the photo is added to the profile photos album, create a new ProfilePhotoPost.
      if @photo.album.role == Album::ROLE_PROFILE_PHOTOS
        ProfilePhotoPost.create! photo: @photo, created_by: current_user, created_for: current_user
      end

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

    # If the photo is removed from the profile photos album, check if it's the current profile photo, and if so, create
    # a new ProfilePhotoPost.
    if photo.album.role == Album::ROLE_PROFILE_PHOTOS
      photoposts = ProfilePhotoPost.all.desc(:_id).limit(2)
      if photoposts[0].photo == photo
        ProfilePhotoPost.create! photo: photoposts[1].photo, created_by: current_user, created_for: current_user
      end
    end

    photo.delete

    redirect_to photo.album
  end


  def set_profile
    photo = Photo.find params[:photo_id]

    # Move the photo to the user's special profile photo directory
    # @todo: duplicate actual image file too!
    photo = Photo.create! album: current_user.profile_photos, image_uid: photo.image_uid, created_by: current_user

    # Create a "user changed his profile picture" post
    ProfilePhotoPost.create! photo: photo, created_by: current_user, created_for: current_user

    redirect_to_back user_url current_user
  end


end
