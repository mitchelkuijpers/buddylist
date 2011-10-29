class Person

  include Mongoid::Document
  include Mongoid::Timestamps

  after_create :create_wall

  # Associations
  belongs_to :user
  has_one :wall
  has_many :posts
  has_many :comments

  # Properties
  field :name, type: String, :required => true

  private

  def create_wall
    Wall.create person: self
  end

end