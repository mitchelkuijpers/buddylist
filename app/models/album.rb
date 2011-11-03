class Album

  include Mongoid::Document

  has_one :user
  has_many :photos

end