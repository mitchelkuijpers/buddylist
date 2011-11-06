
# Newsfeed
#
# Gathers all relevant posts for a user. Posts may be from the user himself, or from his friends.
#
class Newsfeed

  attr_accessor :user, :limit


  # Initialize a new Newsfeed.
  #
  # @param user [User] The user to whom the newsfeed belongs. The content of the feed is based on this user.
  # @param limit [Integer] The amount of posts to display on a single page.
  #
  def initialize user, limit = 25
    @user  = user
    @limit = limit
  end


  # Finds all post in the newsfeed.
  # Searches for posts by/for the feed's user's friends, or by/for the user himself.
  #
  # @return [Mongoid::Criteria] Posts criteria query
  #
  def posts
    # Collect the ids for the users who's posts will fill the newsfeed.
    ids   = @user.friends.collect(&:id) << @user.id

    # Get the posts
    posts = Post.where "$or" => [{ created_by_id: { "$in" => ids } }, { created_for_id: { "$in" => ids } }]
    posts.limit(@limit).desc(:_id)
  end


end
