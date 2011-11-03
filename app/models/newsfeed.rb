class Newsfeed

  class << self

    def find_posts current_user, limit = 30

      Post.any_in(user_id: current_user.friends.collect(&:id) << current_user.id).desc(:created_at).limit(limit)

    end

  end

end