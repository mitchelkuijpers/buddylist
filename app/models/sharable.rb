class Sharable

  include MongoMapper::Document

  belongs_to :person
  many :comments

  key :description

end