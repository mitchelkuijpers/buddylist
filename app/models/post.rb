class Post

  include Mongoid::Document
  include Mongoid::Timestamps

  # Associations
  include Commentable
  include Likable
  has_and_belongs_to_many :users

  # Properties
  field :description


  def author
    users.keep_if { |user| user.id == user_ids[0] }.first
  end


  def receiver
    users.keep_if { |user| user.id == user_ids[-1] }.first
  end


  # Validations
  validates_presence_of :description

end