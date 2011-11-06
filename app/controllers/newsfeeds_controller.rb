
# Newsfeeds Controller
#
# Displays the logged-in user's newsfeed.
#
# @see Newsfeed
#
class NewsfeedsController < ApplicationController

  # Require an authenticated user
  before_filter :authenticate_user!


  # View the current user's newsfeed.
  #
  def view
    newsfeed = Newsfeed.new current_user

    respond_to do |format|
      format.html { render locals: { newsfeed: newsfeed } }
      format.json { render json: newsfeed.posts }
    end
  end

end
