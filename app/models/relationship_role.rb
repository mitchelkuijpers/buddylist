class RelationshipRole

  STATUS_DENIED       = -1
  STATUS_UNDEFINED    = 0
  STATUS_ACCEPTED     = 1

  ROLE_BLOCKED        = -1
  ROLE_FRIEND         = 1
  ROLE_RELATION       = 2
  ROLE_FAMILY         = 3

  include Mongoid::Document
  embedded_in :relationship

  field :status, type: Array, default: []


  def set_status user, status
    self.status[user_index(user)] = status
  end


  def get_status user
    self.status[user_index(user)]
  end


  protected


  def user_index user
    relationship.user_ids.index(user.id)
  end


end
