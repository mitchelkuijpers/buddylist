class RelationshipsController < ApplicationController

  def create_friend
    person = current_user.person
    friend = Person.find params[:person_id]

    # Get the relation, it's friend role, and set the status. If no relation/role exists, create it with a default
    # status for the friend (RelationshipRole::STATUS_UNDEFINED).
    relation = Relationship.find_or_create_for_persons person, friend

    role = relation.relationship_roles.find_or_create_by :role => RelationshipRole::ROLE_FRIEND
    role.status_user[friend.id.to_s] = RelationshipRole::STATUS_ACCEPTED if role.status_user[friend.id.to_s].blank?
    role.status_user[person.id.to_s] = RelationshipRole::STATUS_ACCEPTED
    role.save

    post = FriendshipPost.create description: "FRIENDSHIP", person_ids: [person.id, friend.id]

    redirect_to person_url friend
  end

  def destroy_friend
    person = current_user.person
    friend = Person.find params[:person_id]

    relation = Relationship.find_or_create_for_persons person, friend
    role = relation.relationship_roles.find_or_create_by :role => RelationshipRole::ROLE_FRIEND
    role.status_user[friend.id.to_s] = RelationshipRole::STATUS_UNDEFINED if role.status_user[friend.id.to_s].blank?
    role.status_user[person.id.to_s] = RelationshipRole::STATUS_DENIED
    role.save

    redirect_to person_url friend
  end

  #def read
  #  hans = Person.all.first
  #  friends = hans.friends
  #  bert = friends.first
  #  render json: Relationship.methods #[hans.name, friends.collect(&:name), hans.friend_of?(bert)]
  #end
  #
  #def create
  #  Person.delete_all
  #  Relationship.delete_all
  #
  #  hans = Person.create name: "Hans"
  #  bert = Person.create name: "Bert"
  #
  #  relationship = Relationship.create persons: [hans, bert]
  #  relationship.relationship_roles << RelationshipRole.new(role: RelationshipRole::ROLE_FRIEND, status: [RelationshipRole::STATUS_ACCEPTED, RelationshipRole::STATUS_ACCEPTED])
  #  relationship.relationship_roles << RelationshipRole.new(role: RelationshipRole::ROLE_FAMILY, status: [RelationshipRole::STATUS_DENIED, RelationshipRole::STATUS_DENIED])
  #
  #  render json: { relationship: relationship, roles: relationship.relationship_roles }
  #end

  #def index
  #  persons = Person.all
  #  data = []
  #
  #  for person in persons
  #    rs = person.relations
  #    for r in rs
  #      if r.instance_of? Relationship
  #        data << [r.person_1, r.person_2]
  #      end
  #    end
  #  end
  #
  #  respond_to do |format|
  #    format.all { render :json => [data] }
  #  end
  #end
  #
  #def propose person
  #  person = Person.find person
  #
  #  relation = Relationship.new me, person
  #  relation.save
  #end
  #
  #def accept relation
  #  relation = Relationship.find relation
  #  relation.accept # TODO check if the user is allowed to accept the relation
  #end
  #
  #def deny relation
  #  relation = Relationship.find relation
  #  relation.deny # TODO check if the user is allowed to deny the relation
  #end

end