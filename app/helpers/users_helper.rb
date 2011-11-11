module UsersHelper

  def link_to_user user
    link_to user.name, user_url(user), class: "user-link"
  end

  def link_to_author user
    link_to user.name, user_url(user), class: ["user-link", "author"]
  end


  # Display a user's profile photo
  #
  # @param user [User] The user to display
  # @param size [Symbol] The size of the photo
  # @param target [Symbol] The link target (the user profile, or the photo page)
  # @return [String] Link with image
  #
  def user_photo user, size = :medium, target = :user
    unless user.profile_photos.media.blank?
      sizes = {
        small: '32x32#',
        medium: '50x50#',
        sidebar: '180x'
      }
      url = user.profile_photos.media.last.image.thumb(sizes[size]).url
    else
      url = "person-picture-#{size}.gif"
    end

    if target == :photo
      target = photo_url user.profile_photos.media.last
    else
      target = user_url user
    end

    link_to image_tag(url), target, class: ["user-picture", size]
  end

end
