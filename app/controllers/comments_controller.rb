class CommentsController < ApplicationController

  def new

  end

  def create
    sharable = Sharable.find params[:commentable_id]
    person = Person.all.first # TODO: Get user from session

    comment = Comment.new
    comment.person = person
    comment.text = params[:comment_text]

    sharable.comments << comment
    comment.save

    redirect_to polymorphic_path sharable
  end

end
