module Likable

  def self.included model

    # Associations
    model.has_many :likes, as: :likable

  end

  def liked_by? user
    likes = Like.where user_id: user.id, likable_id: id
    likes.first.instance_of? Like
  end

end