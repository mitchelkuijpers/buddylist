class Post

  include Mongoid::Document
  include Mongoid::Timestamps

  # Associations
  include Commentable
  include Likable
  has_and_belongs_to_many :persons

  # Properties
  field :description

  def author
    self.persons.keep_if{|person| person.id == person_ids[0]}.first
  end

  def receiver
    self.persons.keep_if{|person| person.id == person_ids[-1]}.first
  end

  # Validations
  validates_presence_of :description
end