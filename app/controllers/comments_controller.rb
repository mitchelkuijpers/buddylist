class CommentsController < ApplicationController

  def view
    comment = Comment.find params[:comment_id]
    redirect_to polymorphic_path comment.commentable
  end

  def new

  end

  def create
    collection = Object::const_get(params[:commentable_type])

    unless collection.include? Commentable
       raise test
    end

    commentable = collection.find params[:commentable_id]

    Comment.create text: params[:comment_text], person: current_user.person, commentable: commentable

    redirect_to polymorphic_path commentable
  end

end
