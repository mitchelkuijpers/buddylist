class Album

  include Mongoid::Document
  include Mongoid::Timestamps

  ROLE_USER           = 0
  ROLE_PROFILE_PHOTOS = 1
  ROLE_WALL_PHOTOS    = 2


  # Relations
  belongs_to :created_by, class_name: "User"
  belongs_to :user, inverse_of: :profile_photos
  has_many :media

  # Properties
  field :title, type: String
  field :protected, type: Boolean, default: false
  field :role, type: Integer, default: ROLE_USER

  # Callbacks
  before_destroy :destroy_media


  # Destroy all the album's content before removal
  #
  def destroy_media
    media.delete_all
  end


end
