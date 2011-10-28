class Profile

  include MongoMapper::Document

  # Associations
  belongs_to :person
  many :sharables

end