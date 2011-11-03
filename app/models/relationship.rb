class Relationship

  include Mongoid::Document
  include Mongoid::Timestamps

  field :tid, type: String
  embeds_many :relationship_roles
  has_and_belongs_to_many :users


  class << self


    def find_or_create_for_users user_1, user_2
      find_or_create_by user_ids: [user_1, user_2].sort.collect(&:id)
    end


    # Get relations with an accepted role
    def by_accepted_role role
      where relationship_roles: { "$elemMatch" => { role: role, status: true } }
    end


  end


end