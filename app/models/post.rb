class Post

  include Mongoid::Document
  include Mongoid::Timestamps

  # Associations
  include Commentable
  include Likable
  belongs_to :person
  belongs_to :wall

  # Properties
  field :description

end