class CommentObserver < Mongoid::Observer


  # After a comment is created, create a notification.
  #
  def after_create comment
    # Collect all users that commented on the commentable
    commenters = comment.commentable.comments.collect &:created_by

    # Add the creator (and if applicable, the recipient) of the commentable
    commenters << comment.commentable.created_by
    commenters << comment.commentable.created_for if comment.commentable.respond_to? :created_for

    # Remove the user that created this comment
    commenters.delete comment.created_by

    # Notify all users (only one notification per user)
    for user in commenters.uniq
      CommentNotification.create user: user, comment: comment
    end
  end


end
