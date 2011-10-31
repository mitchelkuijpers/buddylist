module Commentable

  def self.included model

    # Associations
    model.has_many :comments, as: :commentable

  end

end