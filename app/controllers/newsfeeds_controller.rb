class NewsfeedsController < ApplicationController
  before_filter :authenticate_user!


  def view
    posts = Post.where "person_ids.0" => { "$in" => (current_user.person.friends.collect(&:id) << current_user.person.id) }

    #friends = current_user.person.friends
    #
    #return render json: friends

    respond_to do |format|
      format.html { render locals: { posts: posts.reverse } }
      format.json { render json: posts }
    end
  end

end