
# Relationships Controller
#
# Creates, modifies and destroys relations between two users. Also lists unaccepted requests.
#
# @see Relationship
# @see RelationshipRole
# @see FriendsRelationshipRole
#
class RelationshipsController < ApplicationController

  # Require an authenticated user
  before_filter :authenticate_user!


  # Create or confirm a friendship between two users.
  #
  # @see FriendsRelationshipRole
  #
  def create_friend
    user   = current_user
    friend = User.find params[:user_id]

    relation = Relationship.find_or_create_for_users user, friend

    role = relation.find_or_create_role :friends
    role.set_status user, RelationshipRole::STATUS_ACCEPTED
    role.save

    redirect_to user_url friend
  end


  # Block a friendship between two users.
  #
  # @see FriendsRelationshipRole
  #
  def destroy_friend
    user   = current_user
    friend = User.find params[:user_id]

    relation = Relationship.find_or_create_for_users user, friend

    role = relation.find_or_create_role :friends
    role.set_status user, RelationshipRole::STATUS_DENIED
    role.save

    redirect_to user_url friend
  end


  # List the friendship request a user still has to accept or deny.
  # @note Lists all FriendsRelationshipRoles that aren't accepted by the user yet.
  #
  def friend_requests
    users = current_user.friend_requests

    render locals: { users: users }
  end


end
