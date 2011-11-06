class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    redirect_to user_url User.all.first #TODO: Replace with actual homepage
  end

  def search
    user_name = params[:user_name] || ''

    users = User.search_by_name user_name

    respond_to do |format|
      format.html { render locals: { users: users, searchterm: user_name } }
      format.json { render json: users }
    end
  end

  def view_friends
    user = User.find params[:user_id]
    user_name = params[:q]

    friends = user.friends.keep_if { |user| user.name =~ /#{user_name}/i }
    friends.map! { |user| { id: user.id, name: user.name } }

    respond_to do |format|
      # TODO: HTML version
      format.json { render json: friends }
    end
  end

  def view
    user = User.find params[:user_id]

#    authorize! :view, person

    respond_to do |format|
      format.html { render locals: { user: user } }
      format.json { render json: user }
    end
  end

  def edit
    # TODO: Edit logged in user's own profile
  end

end