require 'digest/sha2'

class Person

  include MongoMapper::Document

  attr_accessor :name, :email
  many :sharables

  key :relation_ids, Array
  many :relations, :in => :relation_ids

  key :name,      String
  key :email,     String
  key :password,  String


  # Hash the password when setting it.
  def password= password
    @password = Person.hash_password password
  end

  # Hash a password.
  # TODO: Move to more appropriate location
  def self.hash_password password
    salt = "@#1gh3a9#"
    Digest::SHA512.hexdigest("#{salt}:#{password}:#{salt}")
  end

end