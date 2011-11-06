class LikeObserver < Mongoid::Observer

  def after_create like
    unless like.likable.created_by == like.created_by
      LikeNotification.create like: like, user: like.likable.created_by
    end
  end

  def before_destroy like
    LikeNotification.where(like_id: like.id, user_id: like.likable.user.id).delete_all
  end

end
