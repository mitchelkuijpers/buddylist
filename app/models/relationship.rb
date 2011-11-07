class Relationship

  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_many :roles, class_name: "RelationshipRole"
  has_and_belongs_to_many :users


  def find_or_create_role role
    type = "#{role}RelationshipRole".classify

    role = roles.where _type: type

    unless role.blank?
      role.first
    else
      role = Object.const_get(type).new
      roles << role
      role
    end
  end

  class << self


    def find_or_create_for_users user_1, user_2
      find_or_create_by user_ids: [user_1, user_2].sort.collect(&:id)
    end


    # Get relations with an accepted role
    def by_accepted_role role
      type = "#{role}RelationshipRole".classify
      where roles: { "$elemMatch" => { _type: type, status: [1, 1] } }
    end

    def by_unaccepted_role role
      type = "#{role}RelationshipRole".classify
      where roles: { "$elemMatch" => { _type: type, "$or" => [{ status: [0, 1] }, { status: [1, 0] }] } }
    end


  end


end
