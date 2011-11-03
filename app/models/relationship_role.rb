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

  before_save :calc_status
  before_update :calc_status

  field :role, type: Integer
  field :status_user, type: Hash, default: {}
  field :status, type: Boolean, default: false


  protected


  def calc_status
    self.status = (status_user.values.inject(:+) == status_user.length * STATUS_ACCEPTED)
    true # Callbacks returning false halt the operation
  end


end