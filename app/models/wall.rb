class Wall

  include Mongoid::Document

  # Associations
  belongs_to :person
  has_many :posts

end