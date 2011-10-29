class RelationsController < ApplicationController

  def test
    p1 = Person.all.first

    f = p1.friends

    render json: [p1.name, f.collect(&:name)]
  end

  def test2
    p1 = Person.create name: "Hans"
    p2 = Person.create name: "Jan"


    r = Relationship.create persons: [p1, p2]
    r.relationship_roles << RelationshipRole.new(role: RelationshipRole::ROLE_FRIEND, status_1: RelationshipRole::STATUS_DENIED, status_2: RelationshipRole::STATUS_DENIED)
    r.relationship_roles << RelationshipRole.new(role: 10, status_1: RelationshipRole::STATUS_ACCEPTED, status_2: RelationshipRole::STATUS_ACCEPTED)
    render json: r
  end

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