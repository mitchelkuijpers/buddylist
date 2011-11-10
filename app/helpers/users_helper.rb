module UsersHelper

  def link_to_user user
    link_to user.name, user_url(user), class: "user-link"
  end

  def link_to_author user
    link_to user.name, user_url(user), class: ["user-link", "author"]
  end

  def user_picture user, size = :medium
    unless user.profile_photos.blank?
      sizes = {
        small: '32x32#',
        medium: '50x50#',
        sidebar: '180x'
      }
      url = user.profile_photos.media.last.image.thumb(sizes[size]).url
    else
      url = "person-picture-#{size}.gif"
    end

    link_to image_tag(url), user_url(user), class: ["user-picture", size]
  end

end
