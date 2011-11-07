
# Status Posts Controller
#
# Creates, displays and destroys StatusPosts (status updates).
#
# @see StatusPost
# @see Likable
# @see Like
# @see Commentable
# @see Comment
# @see UserTaggable
# @see UserTag
#
class StatusPostsController < ApplicationController

  # Require an authenticated user
  before_filter :authenticate_user!


  # View a StatusPost
  #
  def view
    post = StatusPost.find params[:post_id]

    authorize! :view, post

    respond_to do |format|
      format.html { render :locals => { :post => post } }
      format.json { render :json => post }
    end
  end


  # Create a StatusPost
  #
  def create
    user = User.find params[:receiver_id]

    authorize! :create_posts, user

    # Create the StatusPost
    @status_post             = StatusPost.new params[:status_post]
    @status_post.created_by  = current_user
    @status_post.created_for = user

    if @status_post.valid? && @status_post.save
      # Create user tags (if provided)
      params[:tagged_users].split(",").each do |user_id|
        user_tag = UserTag.new user_id: user_id

        if can? :create, user_tag
          @status_post.user_tags << user_tag
        end
      end

      # Redirect back, or to the status post url.
      redirect_to_back status_post_path @status_post
    else
      # Show the create StatusPost form
      render action: :new, locals: { receiver: @status_post.created_for }
    end
  end


  # Destroy a StatusPost
  #
  def destroy
    post = StatusPost.find params[:post_id]

    authorize! :destroy, post

    post.delete

    respond_to do |format|
      format.html {redirect_to_back user_url post.created_by}
      format.json { render :json => 'success' }
    end
  end


  protected


  # Display the create a StatusPost form
  #
  def new

  end


end
