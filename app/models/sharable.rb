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

end