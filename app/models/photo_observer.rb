class PhotoObserver < Mongoid::Observer

  observe :photo


  # Create PhotoPosts for photos uploaded to user albums
  #
  def after_create photo
    if photo.album.role == Album::ROLE_USER
      PhotoPost.create! photo: photo, created_by: photo.created_by, created_for: photo.created_by
    end
  end


  # Destroy dependant objects when destroying a photo.
  #
  def before_destroy photo
    ProfilePhotoPost.where(photo_id: photo.id).delete_all
    PhotoPost.where(photo_id: photo.id).delete_all
  end

end
