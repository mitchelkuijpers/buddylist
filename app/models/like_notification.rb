class LikeNotification < Notification
  belongs_to :likable, polymorphic: true
end