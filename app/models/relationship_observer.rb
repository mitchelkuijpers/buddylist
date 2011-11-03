class RelationshipObserver < Mongoid::Observer
  observe :relationship_role

  def after_save relationship

    if relationship.instance_of? Relationship
      RelationshipNotification.create({person: relationship.persons.first, relationship: relationship})
    end

  end

end