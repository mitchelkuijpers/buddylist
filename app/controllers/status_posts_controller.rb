class StatusPostsController < ApplicationController
  before_filter :authenticate_user!

  def view
    post = StatusPost.find params[:post_id]

    respond_to do |format|
      format.html { render :locals => { :post => post } }
      format.json { render :json => post }
    end
  end

  def new

  end

  def create
    person = current_user.person
    friend = Person.find params[:friend_id]
    post = StatusPost.create description: params[:post_description], persons: [person, friend]

    redirect_to status_post_url post
  end

end