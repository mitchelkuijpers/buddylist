class Relationship

  include Mongoid::Document
  include Mongoid::Timestamps

  has_and_belongs_to_many :persons
  embeds_many :relationship_roles

  field :role, type: Integer
  field :status, type: Hash

  class << self

    # Get relations with an accepted role
    def by_role role
      where relationship_roles: { "$elemMatch" => { role: role, status_1: RelationshipRole::STATUS_ACCEPTED, status_2: RelationshipRole::STATUS_ACCEPTED }}
    end

  end

end