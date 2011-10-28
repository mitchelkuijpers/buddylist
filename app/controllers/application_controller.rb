class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :init_models

  private

  # Teun: Fix for MongoMapper SCI
  # Models need to be 'used' before ActiveSupport::DescendantTracker can detect them...
  def init_models
    Wall
    Sharable
    StatusSharable
    VideoSharable
    Like
    Comment
  end

end
