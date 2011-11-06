module Likable

  class << self

    def included model

      # Relations
      model.embeds_many :likes

    end

  end

  # Check whether a user likes this Likable.
  #
  def liked_by? user
    not likes.reject { |like| like.user != user }.blank?
  end

end