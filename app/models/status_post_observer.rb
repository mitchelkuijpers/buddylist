class StatusPostObserver < Mongoid::Observer

  def after_save status_post
    StatusPostNotification.create user: status_post.author, status_post: status_post
  end

end