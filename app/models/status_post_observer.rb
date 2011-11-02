class StatusPostObserver < Mongoid::Observer

  def after_save status_post
    StatusPostNotification.create({person: status_post.person, status_post: status_post})
  end

end