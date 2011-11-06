class LikeObserver < Mongoid::Observer

  def after_save like

    unless like.likable.user == like.user
      LikeNotification.create like: like, user: like.likable.user.id
    end

  end

  def before_destroy like
    LikeNotification.where(like_id: like.id, user_id: like.likable.user.id).delete_all
  end

end