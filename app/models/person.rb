class Person

  include Mongoid::Document
  include Mongoid::Timestamps

  after_create :create_wall

  # Associations
  belongs_to :user
  has_one :wall
  has_many :posts
  has_many :comments
  has_and_belongs_to_many :relationships

  # Properties
  field :name, type: String, :required => true

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