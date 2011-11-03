class NewsfeedsController < ApplicationController
  before_filter :authenticate_user!


  def view
    posts = Post.where "user_ids.0" => { "$in" => (current_user.friends.collect(&:id) << current_user.id) }

    respond_to do |format|
      format.html { render locals: { posts: posts.reverse } }
      format.json { render json: posts.reverse }
    end
  end

end