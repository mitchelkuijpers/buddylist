class Comment

  include MongoMapper::Document

  belongs_to :commentable
  belongs_to :person

  key :text, String

  timestamps!

end