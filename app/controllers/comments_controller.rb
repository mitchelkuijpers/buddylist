
# Comment Controller
#
# Creates, displays and destroys Comments (on Commentables).
#
# @see Comment
# @see Commentable
# @see UserTag
# @see UserTaggable
#
class CommentsController < ApplicationController

  # Require an authenticated user
  before_filter :authenticate_user!


  # View a comment
  #
  # Redirects to the commentable's path, so the comment can be viewed in proper context.
  #
  def view
    comment = Comment.find params[:comment_id]

    authorize! :view, comment

    redirect_to polymorphic_path comment.commentable
  end


  # Create a Comment on a Commentable
  #
  def create
    commentable = retrieve_commentable

    #authorize! :create_comment, commentable

    # Create the comment
    @comment             = Comment.new params[:comment]
    @comment.created_by  = current_user
    @comment.commentable = commentable


    if @comment.valid? && @comment.save
      # Create user tags (if provided)
      params[:tagged_users].split(",").each do |user_id|
        @comment.user_tags.create! user_id: user_id
      end

      # Redirect back, or to the commentable's url
      redirect_to_back polymorphic_path @comment.commentable
    else
      # Display the create comment form
      render action: :new, locals: { commentable: @comment.commentable }
    end
  end


  # Destroy a comment
  #
  def destroy
    comment = Comment.find params[:comment_id]

    #authorize! :destroy, comment

    comment.delete

    redirect_to_back polymorphic_path comment.commentable
  end


  private


  # Display the form for creating new comments.
  #
  def new

  end


  # Retrieve the commentable based on the provided type and id.
  #
  # @return [Commentable] The commentable the comment is related with.
  #
  def retrieve_commentable
    collection = Object::const_get params[:commentable_type]

    unless collection.include? Commentable
      raise "Can't comment on this type of post."
    end

    commentable = collection.find params[:commentable_id]

    #authorize! :view, commentable

    commentable
  end

end
