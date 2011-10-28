module LikesHelper

  def format_liking_persons likable
    person = current_user.person

    unless likable.likes.blank?
      formatted = likable.likes.delete_if{ |like| like.person == person }.collect{ |like| link_to like.person.name, person_url(like.person) }
      formatted.unshift link_to 'You', person_url(person) if likable.liked_by? person

      unless formatted.blank?
        formatted.to_sentence.html_safe + " liked this."
      end
    end
  end

end