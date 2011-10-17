class Comment

  include MongoMapper::Document

  belongs_to :commentable, :polymorphic => true

  key :text, String

end