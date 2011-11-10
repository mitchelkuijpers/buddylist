class Album

  include Mongoid::Document
  include Mongoid::Timestamps

  # Relations
  belongs_to :created_by, class_name: "User"
  belongs_to :user, inverse_of: :profile_photos
  has_many :media

  # Properties
  field :title, type: String
  field :protected, type: Boolean, default: false

  # Callbacks
  before_destroy :destroy_media


  # Destroy all the album's content before removal
  #
  def destroy_media
    media.delete_all
  end

  # Validation
  validates_presence_of :title, message: "can't be empty."
  validates_format_of :title, with: /[A-Za-z0-9]/, message: "can only have characters and numbers."
  validates_length_of :title,  minimum: 3, maximum: 20, message: "is too short (minimum is 3 characters)."
  validates_uniqueness_of :title, case_sensitive: false

end
