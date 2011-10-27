require 'digest/sha2'

class Person

  include MongoMapper::Document

  attr_accessor :name, :email
  many :sharables
  many :comments

  key :relation_ids, Array
  many :relations, :in => :relation_ids

  key :name,      String, :required => true
  key :email,     String, :required => true

  timestamps!

end