class CommentObserver < Mongoid::Observer

  # When a comment is saved, create a notification
  def after_save comment
    original_author   = comment.commentable.author.id
    original_receiver = comment.commentable.receiver.id

    commenters = comment.commentable.comments.collect(&:person_id)
    commenters << original_receiver << original_author

    # remove current_commenter
    current_commenter = comment.person.id
    commenters.delete(current_commenter)

    # remove duplicates
    commenters = commenters.uniq

    # notify persons
    for person in commenters
      CommentNotification.create( { person: person, comment: comment } )
    end

  end

end