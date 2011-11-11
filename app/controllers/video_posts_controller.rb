class VideoPostsController < ApplicationController

  before_filter :authenticate_user!

  def view
    videopost = VideoPost.find params[:video_id]

    authorize! :view, videopost

    respond_to do |format|
      format.html { render locals: { videopost: videopost } }
      format.json { render json: videopost }
    end

  end

  def create
    receiver = User.find params[:receiver_id]

    authorize! :create_video_posts, receiver

    # VideoPost
    @video_post             = VideoPost.new params[:video_post]
    @video_post.created_by  = current_user
    @video_post.created_for = receiver

    if @video_post.valid? && @video_post.save!
      redirect_to_back video_post_path @video_post
    else
      render action: :new, locals: { receiver: receiver }
    end

  end

  def destroy
    videopost = VideoPost.find params[:video_id]

    authorize! :destroy, videopost

    videopost.delete

    respond_to do |format|
      format.html { redirect_to_back user_url videopost.created_by }
      format.json { render json: "deleted" }
    end
  end

  def new

  end
end