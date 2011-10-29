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
    f = []
    relationships.by_role(RelationshipRole::ROLE_FRIEND).each do |r|
      f += r.persons.delete_if{|p| p == self}
    end
    f
  end

end