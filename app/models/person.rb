class Person

  include MongoMapper::Document

  many :sharables
  many :relations

  key :name,    String
  key :email,   String

end