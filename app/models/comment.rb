class Comment

  include Mongoid::Document
  include Mongoid::Timestamps

  # Associations
  include Likable
  belongs_to :commentable, polymorphic: true
  belongs_to :person

  # Validation
  validates_presence_of :message

  # Properties
  field :message, type: String

end