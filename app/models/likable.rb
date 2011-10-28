module Likable

  def self.included model

    # Associations
    model.many :likes, as: :likable

  end

  def liked_by? person
    Like.by_person(person).first.instance_of? Like
  end

end