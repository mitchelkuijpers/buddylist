class Person

  include Mongoid::Document
  include Mongoid::Timestamps

  # Associations
  belongs_to :user
  has_one :wall
  has_many :comments
  has_and_belongs_to_many :relationships
  has_and_belongs_to_many :posts

  # Validation
  validates_presence_of :name

  # Properties
  field :name, type: String

  def friends
    persons = []
    relationships.by_accepted_role(RelationshipRole::ROLE_FRIEND).each do |r|
      persons += r.persons
    end
    persons.delete_if {|person| person == self}
  end

  def friend_requests
    # TODO Implement
  end

  def friend_of? person
    friends.include? person
  end

end