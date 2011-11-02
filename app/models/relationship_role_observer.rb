class RelationshipRoleObserver < Mongoid::Observer

  #before_save :calc_status
  #before_update :calc_status
  #
  #def calc_status
  #  self.status = (status_user.values.inject(:+) == status_user.length * STATUS_ACCEPTED)
  #  true # Callbacks returning false halt the operation
  #end

end