class RelationshipObserver < Mongoid::Observer

  def after_save relationship
    RelationshipNotification.create user: relationship.users.first, relationship: relationship
  end

end