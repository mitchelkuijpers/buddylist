class LikeNotification < Notification
  belongs_to :like, polymorphic: true
  belongs_to :author, class_name: "User"
end