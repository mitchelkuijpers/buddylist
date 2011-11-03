class LikesController < ApplicationController


  def create
    likable = likable_collection.find params[:likable_id]

    Like.create! likable: likable, user: current_user

    redirect_to_back polymorphic_path likable
  end


  def destroy
    likable = likable_collection.find params[:likable_id]

    likes = Like.where user_id: current_user.id, likable_id: likable.id
    likes.each do |like|
      like.destroy
    end

    redirect_to_back polymorphic_path likable
  end


  private


  def likable_collection
    collection = Object::const_get params[:likable_type]

    unless collection.include? Likable
      raise "Can't like this type of post."
    end

    collection
  end


end