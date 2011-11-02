class NewsfeedsController < ApplicationController
  before_filter :authenticate_user!

  def view
    posts = Newsfeed.find_posts current_user.person

    #friends = current_user.person.friends
    #
    #return render json: friends

    respond_to do |format|
      format.html { render locals: { posts: posts } }
      format.json { render json: posts }
    end
  end

end