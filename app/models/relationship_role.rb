class RelationshipRole

  STATUS_ACCEPTED = 1
  STATUS_DENIED = -1

  ROLE_FRIEND = 1

  include Mongoid::Document
  embedded_in :relationship


end