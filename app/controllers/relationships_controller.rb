class RelationshipsController < ApplicationController


  def create_friend
    user     = current_user
    friend   = User.find params[:user_id]

    # Get the relation, it's friend role, and set the status. If no relation/role exists, create it with a default
    # status for the friend (RelationshipRole::STATUS_UNDEFINED).
    relation = Relationship.find_or_create_for_users user, friend
    role     = relation.relationship_roles.find_or_create_by :role => RelationshipRole::ROLE_FRIEND
    role.status_user[friend.id.to_s] = RelationshipRole::STATUS_ACCEPTED if role.status_user[friend.id.to_s].blank?
    role.status_user[user.id.to_s] = RelationshipRole::STATUS_ACCEPTED
    role.save

    post = FriendshipPost.create description: "FRIENDSHIP", user_ids: [user.id, friend.id]

    redirect_to user_url friend
  end


  def destroy_friend
    user   = current_user
    friend = User.find params[:user_id]

    relation = Relationship.find_or_create_for_users user, friend
    role     = relation.relationship_roles.find_or_create_by :role => RelationshipRole::ROLE_FRIEND
    role.status_user[friend.id.to_s] = RelationshipRole::STATUS_UNDEFINED if role.status_user[friend.id.to_s].blank?
    role.status_user[user.id.to_s] = RelationshipRole::STATUS_DENIED
    role.save

    redirect_to user_url friend
  end


end