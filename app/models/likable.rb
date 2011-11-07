module Likable

  class << self

    def included model

      # Relations
      model.embeds_many :likes, as: :likable
      model.has_many :like_notifications
    end

  end

  # Check whether a user likes this Likable.
  #
  def liked_by? user
    not likes.reject { |like| like.created_by != user }.blank?
  end

end
