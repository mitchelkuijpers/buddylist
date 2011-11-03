class Photo

  include Mongoid::Document

  belongs_to :album
  belongs_to :user

  include Commentable
  include Likable

  field :description, type: String
  field :image, type: String

end