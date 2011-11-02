class CommentObserver < Mongoid::Observer

  # When a comment is saved, create a notification
  def after_save comment

    # Change comment.commentable.person to comment.commentable.receiver
    CommentNotification.create({person: comment.commentable.person, comment: comment})
  end

end