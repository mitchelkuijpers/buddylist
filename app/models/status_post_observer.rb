class StatusPostObserver < Mongoid::Observer

  def after_save status_post

    # Don't notify when the person post it on his own wall.
    unless status_post.author == status_post.receiver
      StatusPostNotification.create user: status_post.author, status_post: status_post
    end

  end

end