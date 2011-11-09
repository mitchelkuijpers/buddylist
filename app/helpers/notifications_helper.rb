module NotificationsHelper


  def determine_liked_type likable

    if likable.instance_of? StatusPost

      link = link_to likable.description, status_post_url(likable)
      raw "status " + link

    elsif likable.instance_of? PhotoPost

      link = link_to likable.description, photo_post_url(likable)
      raw " photo " + link

    elsif likable.instance_of? Comment

      link = link_to likable.message, status_post_url(likable.commentable)
      raw " comment " + link

    end

  end


end