module Likable

  def self.included model

    # Associations
    model.has_many :likes, as: :likable

  end

  def liked_by? person
    likes = Like.where person_id: person.id, likable_id: self.id
    likes.first.instance_of? Like
  end

end