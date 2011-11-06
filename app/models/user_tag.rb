class UserTag

  include Mongoid::Document

  belongs_to :user
  belongs_to :user_taggable, polymorphic: true

end