module UserTagsHelper

  def format_tagged_users user_taggable
    ""
    unless user_taggable.user_tags.blank?
      users = user_taggable.user_tags.map { |user_tag| link_to user_tag.user.name, user_url(user_tag.user) }
      ('<span class="with">with ' + users.to_sentence + '.</span>').html_safe
    end
  end

end