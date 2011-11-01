class CommentsController < ApplicationController
  before_filter :retrieve_commentable


  def view
    comment = Comment.find params[:comment_id]

    redirect_to polymorphic_path comment.commentable
  end


  def create
    commentable = retrieve_commentable

    @comment             = Comment.new params[:comment]
    @comment.person      = current_user.person
    @comment.commentable = commentable

    begin
      @comment.save!
      redirect_to polymorphic_path commentable
    rescue
      render action: :new, locals: { commentable: commentable }
    end
  end


  private


  def new
  end


  def retrieve_commentable
    collection = Object::const_get(params[:commentable_type])

    unless collection.include? Commentable
      raise "Invalid Collection"
    end

    collection.find params[:commentable_id]
  end


end
