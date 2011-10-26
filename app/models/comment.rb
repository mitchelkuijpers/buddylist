class Comment

  include MongoMapper::Document

  belongs_to :sharable

  key :text, String

end