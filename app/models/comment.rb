class Comment

  include MongoMapper::Document

  belongs_to :sharable
  belongs_to :person

  key :text, String

  timestamps!

end