class Photo < Media

  include Commentable
  include Likable

  field :title, type: String
  field :image_uid

  image_accessor :image

end
