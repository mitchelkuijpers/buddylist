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
    return self.persons.first
  end

  def author= person
    self.persons[0] = person
  end

  def receiver
    return self.persons.last
  end

  def receiver= person
    self.persons[1] = person
  end

  # Validations
  validates_presence_of :description
end