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
    person = current_user.person
    receiver = Person.find params[:receiver_id]

    @status_post = StatusPost.new params[:status_post]
    @status_post.persons = [person, receiver]

    if @status_post.valid? && @status_post.save
      redirect_to status_post_path @status_post
    else
      render action: :new, locals: { receiver: receiver }
    end
  end


  protected


  def new

  end


end