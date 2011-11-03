class CommentsController < ApplicationController
  before_filter :retrieve_commentable


  def view
    comment = Comment.find params[:comment_id]

    redirect_to polymorphic_path comment.commentable
  end


  def create
    commentable = retrieve_commentable

    @comment             = Comment.new params[:comment]
    @comment.user        = current_user
    @comment.commentable = commentable

    if @comment.valid? && @comment.save
      redirect_to_back polymorphic_path commentable
    else
      render action: :new, locals: { commentable: commentable }
    end
  end


  private


  def new

  end


  def retrieve_commentable
    collection = Object::const_get params[:commentable_type]

    unless collection.include? Commentable
      raise "Can't comment on this type of post."
    end

    collection.find params[:commentable_id]
  end


end
