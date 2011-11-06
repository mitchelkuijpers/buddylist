class CommentsController < ApplicationController

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
      params[:tagged_users].split(",").each do |user_id|
        @comment.user_tags.create!(user_id: user_id)
      end

      redirect_to_back polymorphic_path commentable
    else
      render action: :new, locals: { commentable: commentable }
    end
  end

  def destroy
    comment = Comment.find params[:comment_id]
    comment.delete

    redirect_to_back polymorphic_path comment.commentable
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
