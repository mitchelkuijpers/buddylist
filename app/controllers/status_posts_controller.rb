class StatusPostsController < ApplicationController
  before_filter :authenticate_user!

  def view
    post = StatusPost.find params[:post_id]

    respond_to do |format|
      format.html { render :locals => { :post => post } }
      format.json { render :json => post }
    end
  end

  def create
    receiver = User.find params[:receiver_id]

    @status_post       = StatusPost.new params[:status_post]
    @status_post.users = [current_user, receiver]

    if @status_post.valid? && @status_post.save
      params[:tagged_users].split(",").each do |user_id|
        @status_post.user_tags.create!(user_id: user_id)
      end

      redirect_to_back status_post_path @status_post
    else
      render action: :new, locals: { receiver: receiver }
    end
  end

  def destroy
    status_post = StatusPost.find params[:post_id]
    status_post.delete

    redirect_to_back user_url status_post.author
  end

  protected


  def new

  end


end