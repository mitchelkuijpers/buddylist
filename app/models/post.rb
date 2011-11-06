class Post

  include Mongoid::Document
  include Mongoid::Timestamps

  # Associations
  include Commentable
  include Likable
  include UserTaggable
  belongs_to :created_by, class_name: "User", inverse_of: :created_posts
  belongs_to :created_for, class_name: "User", inverse_of: :received_posts


  #def author
  #  users.keep_if { |user| user.id == user_ids[0] }.first
  #end
  #
  #
  #def receiver
  #  users.keep_if { |user| user.id == user_ids[-1] }.first
  #end

end
