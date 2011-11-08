
# Likes Controller
#
# Creates and destroys Likes on Likables.
#
# @see Like
# @see Likable
#
class LikesController < ApplicationController

  # Require an authenticated user
  before_filter :authenticate_user!


  # Create a new Like on a Likable.
  #
  def create
    likable = retrieve_likable

    authorize! :create_like, likable

    likable.likes.create! created_by: current_user

    # Nasty way of notify the person(s)
    create_like_notifications likable

    redirect_to_back polymorphic_path likable
  end


  # Remove a Like from a Likable.
  #
  def destroy
    likable = retrieve_likable

    likable.likes.where(created_by_id: current_user.id).each do |like|
      authorize! :destroy, like
      like.destroy
    end

    # Also delete the notifications
    delete_like_notifications likable

    redirect_to_back polymorphic_path likable
  end


  private


  # Retrieve the likable, based on the provided likable's type and id.
  #
  # @return [Likable] The Likable the Like is related with.
  #
  def retrieve_likable
    collection = Object::const_get params[:likable_type]
    unless collection.include? Likable
      raise "Can't like this type of post."
    end

    likable = collection.find params[:likable_id]

    authorize! :view, likable

    likable
  end

  # Create like notifications for the persons
  #
  # @param [likable] The likable that is liked by the current_user
  #
  def create_like_notifications likable

    notify_persons = []

    # if a post is liked, check author and receiver
    if likable.kind_of? Post

      # only notify someone when the user doesn't likes his own message
      unless likable.created_for == current_user and likable.created_by == current_user

        notify_persons << likable.created_for unless (likable.created_for == current_user)
        notify_persons << likable.created_by unless (likable.created_by == current_user)

      end
    elsif likable.instance_of? Comment

      notify_persons << likable.created_by unless (likable.created_by == current_user)

    end

    for person in notify_persons.uniq do
      LikeNotification.create like: likable, user: person, author: current_user.id
    end

  end

  # Delete like notifications when a likable is unliked
  #
  # @param [likable] The likable that is unliked by the current_user
  #
  def delete_like_notifications likable
    LikeNotification.where(like_id: likable.id).delete_all
  end
end
