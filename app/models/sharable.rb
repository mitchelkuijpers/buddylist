class Sharable

  include MongoMapper::Document

  # Associations
  include Commentable
  include Likable
  belongs_to :person
  belongs_to :wall

  # Properties
  key :description
  timestamps!

  # Validations
  validates_presence_of :description
end