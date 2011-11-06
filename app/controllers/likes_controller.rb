
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
    likable.likes.create! created_by: current_user

    redirect_to_back polymorphic_path likable
  end


  # Remove a Like from a Likable.
  #
  def destroy
    likable = retrieve_likable
    likable.likes.where(created_by_id: current_user.id).delete_all

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
    collection.find params[:likable_id]
  end


end
