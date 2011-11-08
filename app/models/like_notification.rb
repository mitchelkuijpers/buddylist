class LikeNotification < Notification
  belongs_to :like, polymorphic: true
end