class Commentable

  include MongoMapper::Document

  many :comments

end