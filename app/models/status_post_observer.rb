class StatusPostObserver < Mongoid::Observer

  def after_save status_post

    # Don't notify when the person post it on his own wall.
    unless status_post.created_by == status_post.created_for
      StatusPostNotification.create user: status_post.created_for, status_post: status_post
    end

  end

end
