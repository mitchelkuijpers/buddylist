class Comment

  include Mongoid::Document
  include Mongoid::Timestamps

  # Associations
  include Likable
  belongs_to :commentable, polymorphic: true
  belongs_to :person

  # Properties
  field :text, type: String

end