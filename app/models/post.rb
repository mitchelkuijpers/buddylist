class Post

  include Mongoid::Document
  include Mongoid::Timestamps

  # Associations
  include Commentable
  include Likable
  include UserTaggable
  has_and_belongs_to_many :users


  def author
    users.keep_if { |user| user.id == user_ids[0] }.first
  end


  def receiver
    users.keep_if { |user| user.id == user_ids[-1] }.first
  end

end