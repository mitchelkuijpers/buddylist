class Photo < Media

  include Commentable
  include Likable

  field :title, type: String
  field :image_uid

  image_accessor :image

  # Validation
  validates_presence_of :title, message: "can't be empty."
  validates_format_of :title, with: /[A-Za-z0-9]/, message: "can only have characters and numbers."
  validates_presence_of :image, message: "can't be empty."

end
