module LikesHelper


  # Generate a sentence of the users liking a given Likable.
  #
  #   "You, Danny Cobussen and Mitchel Kuijpers like this."
  #
  def format_liking_users likable
    unless likable.likes.blank?
      # Remove the current user because we want him to be on front and with 'You' instead of his name.
      format = likable.likes.reject { |like| like.created_by == current_user }

      # Create links to the liking users (still without current_user).
      format.collect! { |like| link_to like.created_by.name, user_url(like.created_by) }

      if likable.liked_by? current_user
        # Add current_user to the front of the list.
        format.unshift link_to 'You', user_url(current_user)
      end

      # Combine links and append "like this.".
      "#{format.to_sentence} like this.".html_safe
    end
  end


end
