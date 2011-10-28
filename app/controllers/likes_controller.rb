class LikesController < ApplicationController

  def create
    likable = likable_collection.find params[:likable_id]

    Like.create likable: likable, person: current_user.person

    redirect_to polymorphic_path likable
  end

  def destroy
    likable = likable_collection.find params[:likable_id]

    #like = Like.where person_id: current_user.person.id, likable_id: likable.id

    likes = Like.find_all_by_person_id_and_likable_id current_user.person.id, likable.id
    likes.each do |like|
      like.destroy
    end

    redirect_to polymorphic_path likable
  end

  private
  def likable_collection
    collection = Object::const_get(params[:likable_type])

    unless collection.include? Likable
       raise test
    end

    collection
  end

end