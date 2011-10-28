module Commentable

  def self.included model

    # Associations
    model.many :comments, as: :commentable

  end

end