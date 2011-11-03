class FriendshipPost < Post

  has_and_belongs_to_many :users

end