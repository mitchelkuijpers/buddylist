class Relation

  include MongoMapper::Document

  belongs_to :person
  one :person

  key :status

end