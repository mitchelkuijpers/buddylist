module UsersHelper

  def link_to_user user
    link_to user.name, user_url(user), class: "user-link"
  end

  def link_to_author user
    link_to user.name, user_url(user), class: ["user-link", "author"]
  end

  def user_picture user, size = :medium
    link_to image_tag("person-picture-medium.gif"), user_url(user), class: ["user-picture", size]
  end

end