class Sharable
  include MongoMapper::Document

  belongs_to :person

  many :comments, :as => :commentable
end