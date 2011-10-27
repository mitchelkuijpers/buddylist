require 'digest/sha2'

class Person

  include MongoMapper::Document

  attr_accessor :name, :email

  belongs_to :user

  many :sharables
  many :comments

  key :relation_ids, Array
  many :relations, :in => :relation_ids

  key :name,      String
  key :email,     String
  key :password,  String

  timestamps!

end