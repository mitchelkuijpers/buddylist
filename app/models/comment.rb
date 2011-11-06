class Comment

  include Mongoid::Document
  include Mongoid::Timestamps

  # Associations
  include Likable
  include UserTaggable
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  # Validation
  validates_presence_of :message

  # Properties
  field :message, type: String

end