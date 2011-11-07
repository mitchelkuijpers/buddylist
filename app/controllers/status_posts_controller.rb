
# Status Posts Controller
#
# Creates, displays and destroys StatusPosts (status updates).
#
# @see StatusPost
# @see UserTaggable
#
class StatusPostsController < ApplicationController

  # Require an authenticated user
  before_filter :authenticate_user!


  # View a StatusPost
  #
  def view
    post = StatusPost.find params[:post_id]

    respond_to do |format|
      format.html { render :locals => { :post => post } }
      format.json { render :json => post }
    end
  end


  # Create a StatusPost
  #
  def create
    # Create the StatusPost
    @status_post             = StatusPost.new params[:status_post]
    @status_post.created_by  = current_user
    @status_post.created_for = User.find params[:receiver_id]

    if @status_post.valid? && @status_post.save
      # Create user tags (if provided)
      params[:tagged_users].split(",").each do |user_id|
        @status_post.user_tags.create!(user_id: user_id)
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
    status_post = StatusPost.find params[:post_id]
    status_post.delete

    redirect_to_back user_url status_post.created_by
  end


  protected


  # Display the create a StatusPost form
  #
  def new

  end


end
