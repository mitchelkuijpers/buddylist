class Person

  include MongoMapper::Document

  # Associations
  belongs_to :user
  one :profile
  many :sharables
  many :comments

  # Properties
  key :name,      String, :required => true
  timestamps!

end