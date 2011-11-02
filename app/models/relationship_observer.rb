class RelationshipObserver < Mongoid::Observer

  def after_save relationship
    RelationshipNotification.create({person: relationship.persons.first, relationship: relationship})
  end

end