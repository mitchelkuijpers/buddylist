module UserTaggable

  class << self

    def included model

      # Associations
      model.has_many :user_tags, as: :user_taggable

    end

  end

end