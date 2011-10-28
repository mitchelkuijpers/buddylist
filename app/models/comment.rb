class Comment

  include MongoMapper::Document

  # Associations
  include Likable
  belongs_to :commentable, polymorphic: true
  belongs_to :person

  # Properties
  key :text, String
  timestamps!

end