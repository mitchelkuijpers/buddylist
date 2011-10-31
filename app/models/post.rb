class Post

  include Mongoid::Document
  include Mongoid::Timestamps

  # Associations
  include Commentable
  include Likable
  has_and_belongs_to_many :persons

  # Properties
  field :description

  # Validations
  validates_presence_of :description
end