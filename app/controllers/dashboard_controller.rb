class DashboardController < ApplicationController


  # Handle requests to the root url.
  # For signed in users, redirect to their newsfeed. For unauthorized users, display the search user page.
  #
  def index
    if user_signed_in?
      redirect_to newsfeed_url
    else
      redirect_to search_user_url
    end
  end


end
