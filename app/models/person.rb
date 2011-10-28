class Person

  include MongoMapper::Document

  after_create :create_wall

  # Associations
  belongs_to :user
  one :wall
  many :sharables
  many :comments

  # Properties
  key :name,      String, :required => true
  timestamps!

  private

  def create_wall
    Wall.create person: self
  end

end