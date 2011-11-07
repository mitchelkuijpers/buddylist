class LikeObserver < Mongoid::Observer

  def after_save like

    unless like.likable.created_by == like.created_by
      LikeNotification.create! likable: like.likable.id, user: like.likable.created_by
    end

  end

  def after_update like
    puts "----------------------------------------"
    puts "----------------------------------------"
    puts "----------------------------------------"
    puts "----------------------------------------"

    puts like.inspect

    puts "----------------------------------------"
    puts "----------------------------------------"
    puts "----------------------------------------"
    puts "----------------------------------------"
  end

  def before_destroy like
    LikeNotification.where(like_id: like.id, user_id: like.likable.created_by.id).delete_all
  end

end
