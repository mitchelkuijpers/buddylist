class RelationshipsController < ApplicationController


  def create_friend
    user   = current_user
    friend = User.find params[:user_id]

    relation = Relationship.find_or_create_for_users user, friend
    role     = relation.find_or_create_role :friends

    role.set_status friend, RelationshipRole::STATUS_ACCEPTED if role.get_status(friend).blank?
    role.set_status user, RelationshipRole::STATUS_ACCEPTED
    role.save

    post = FriendshipPost.create description: "FRIENDSHIP", user_ids: [user.id, friend.id]

    redirect_to user_url friend
  end


  def destroy_friend
    user   = current_user
    friend = User.find params[:user_id]

    relation = Relationship.find_or_create_for_users user, friend
    role     = relation.find_or_create_role :friends

    role.set_status friend, RelationshipRole::STATUS_UNDEFINED if role.get_status(friend).blank?
    role.set_status user, RelationshipRole::STATUS_DENIED
    role.save

    redirect_to user_url friend
  end


end
