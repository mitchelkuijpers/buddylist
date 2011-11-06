
# Users Controller
#
# Displays user profiles, facilitates user search and user friends search.
#
# @see User
#
class UsersController < ApplicationController


  # Search for users based on their name.
  #
  def search
    user_name = params[:user_name] ||= ''

    users = User.search_by_name user_name

    respond_to do |format|
      format.html { render locals: { users: users, searchterm: user_name } }
      format.json { render json: users }
    end
  end


  # Search for users based on their name that are friends of a certain user.
  #
  # @todo Make sure the current_user has access to the user used for the search.
  #
  def search_friends
    authenticate_user!

    user    = User.find params[:user_id]
    friends = user.search_friends_by_name params[:q]

    respond_to do |format|
      format.json { render json: friends.map! { |user| { id: user.id, name: user.name } } }
    end
  end


  # View a user's profile page.
  #
  def view
    user = User.find params[:user_id]

    respond_to do |format|
      format.html { render locals: { user: user } }
      format.json { render json: user }
    end
  end


end
