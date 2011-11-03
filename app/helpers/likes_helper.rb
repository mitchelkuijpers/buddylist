module LikesHelper

  def format_liking_users likable
    unless likable.likes.blank?
      formatted = likable.likes.delete_if{ |like| like.user == current_user }.collect{ |like| link_to like.user.name, user_url(like.user) }
      formatted.unshift link_to 'You', user_url(current_user) if likable.liked_by? current_user

      unless formatted.blank?
        formatted.to_sentence.html_safe + " like this."
      end
    end
  end

end