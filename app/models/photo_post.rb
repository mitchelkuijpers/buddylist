class PhotoPost < Post

  include Mongoid::Document

  has_many :photos

end