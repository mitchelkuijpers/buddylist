class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    redirect_to user_url User.all.first #TODO: Replace with actual homepage
  end

  def search
    # TODO: Make security less strict
    user_name = params[:user_name] || ''

    users = User.search_by_name user_name

    respond_to do |format|
      format.html { render locals: { users: users, searchterm: user_name } }
      format.json { render json: users }
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