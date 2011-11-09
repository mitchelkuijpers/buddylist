class Album

  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  belongs_to :user, inverse_of: :profile_photos
  has_many :media

  field :title, type: String
  field :protected, type: Boolean, default: false

end
