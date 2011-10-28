class Relation

  include MongoMapper::Document

  belongs_to :person_1, :class_name => 'Person'
  belongs_to :person_2, :class_name => 'Person'

  # Status of the relation
  key :status,  Integer

  timestamps!

end