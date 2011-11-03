class PhotoController < ApplicationController


  def new

  end


  def create
    @photo = Photo.new params[:photo]

    if @photo.valid? && @photo.save
      redirect_to_back album_url @photo.album
    else
      render action: :new
    end
  end


  def destroy
    photo = Photo.find params[:photo_id]
    photo.delete

    redirect_to_back photo.album
  end


end